import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/home/cubit/home_cubit.dart';
import 'package:app_food/features/home/views/widget/card_item.dart';
import 'package:app_food/features/home/views/widget/category_shimmer.dart';
import 'package:app_food/features/home/views/widget/catogery_item.dart';
import 'package:app_food/features/home/views/widget/saerch_app.dart';
import 'package:app_food/features/home/views/widget/user_header.dart';
import 'package:app_food/features/product/view/producr_detalse_view.dart';
import 'package:app_food/features/shared/no_internet_widget.dart';
import 'package:app_food/features/shared/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  late ScrollController scrollController;

  int selectIndex = 0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    final homeCubit = context.read<HomeCubit>();

    // نجلب أول صفحة فقط
    homeCubit.fetchCategories();
    homeCubit.fetchProducts();

    // تحميل المزيد عند الوصول لنهاية الصفحة
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 300) {
        final homeCubit = context.read<HomeCubit>();
        if (homeCubit.hasMore) {
          homeCubit.fetchProducts();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            // ======================= HEADER =======================
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              elevation: 0,
              expandedHeight: 220,
              collapsedHeight: 117,

              // toolbarHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      UserHeader(
                        username:
                            context.watch<AuthCubit>().user?.name ?? "Guest",
                        userImage: context.watch<AuthCubit>().user?.image,
                      ),
                      const Gap(10),
                      const SearchApp(),
                    ],
                  ),
                ),
              ),
            ),

            // ======================= CATEGORIES =======================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeCatogeryLoading ||
                      current is HomeCatogerySuccess ||
                      current is HomeCatogeryFailure ||
                      current is HomeInitial,
                  builder: (context, state) {
                    if (state is HomeCatogeryLoading || state is HomeInitial) {
                      return const CategoryShimmer();
                    } else if (state is HomeCatogerySuccess) {
                      final categories = state.categories
                          .map((e) => e.name)
                          .toList();
                      return CatogeryItem(
                        catogetry: categories,
                        selectIndex: selectIndex,
                      );
                    } else if (state is HomeCatogeryFailure) {
                      if (_isNoInternet(state.error)) {
                        return NoInternetWidget(
                          onRetry: () =>
                              context.read<HomeCubit>().refreshHome(),
                        );
                      }
                      return Center(child: Text(state.error));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),

            // ======================= PRODUCTS =======================
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              sliver: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is HomeProductLoading ||
                    current is HomeProductSuccess ||
                    current is HomeProductFailure,
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();
                  final products = cubit.products;
                  final width = MediaQuery.of(context).size.width;
                  final crossAxisCount = width >= 600 ? 3 : 2;
                  final childAspectRatio = width >= 600 ? 0.9 : 0.78;

                  // تحميل أول صفحة
                  if (state is HomeProductLoading && products.isEmpty) {
                    return const ProductGridShimmer();
                  }

                  // عرض المنتجات
                  if (products.isNotEmpty) {
                    return SliverGrid.builder(
                      itemCount: cubit.hasMore
                          ? products.length + 1
                          : products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        // لو وصلنا آخر عنصر → نعرض لودينج بس، بدون نداء للدالة!
                        if (index == products.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProducrDetalseView(productId: product.id),
                              ),
                            );
                          },
                          child: CardItem(
                            image: product.image,
                            rate: product.rating,
                            subtitel: product.name,
                            titel: product.name,
                          ),
                        );
                      },
                    );
                  }

                  // لو حصل فشل
                  if (state is HomeProductFailure) {
                    return SliverToBoxAdapter(
                      child: _isNoInternet(state.error)
                          ? NoInternetWidget(
                              onRetry: () =>
                                  context.read<HomeCubit>().refreshHome(),
                            )
                          : Center(child: Text(state.error)),
                    );
                  }

                  return const SliverToBoxAdapter(child: SizedBox());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isNoInternet(String message) {
  final lower = message.toLowerCase();
  return lower.contains('connection timeout') ||
      lower.contains('internet connection') ||
      lower.contains('failed host lookup') ||
      lower.contains('no internet');
}
