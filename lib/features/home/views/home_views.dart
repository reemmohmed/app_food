import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/home/cubit/home_cubit.dart';
import 'package:app_food/features/home/views/widget/card_item.dart';
import 'package:app_food/features/home/views/widget/category_shimmer.dart';
import 'package:app_food/features/home/views/widget/catogery_item.dart';
import 'package:app_food/features/home/views/widget/saerch_app.dart';
import 'package:app_food/features/home/views/widget/user_header.dart';
import 'package:app_food/features/product/view/producr_detalse_view.dart';
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
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();
                  final products = cubit.products;

                  // تحميل أول صفحة
                  if (state is HomeProductLoading && products.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  // عرض المنتجات
                  if (products.isNotEmpty) {
                    return SliverGrid.builder(
                      itemCount: cubit.hasMore
                          ? products.length + 1
                          : products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.78,
                          ),
                      itemBuilder: (context, index) {
                        // لو وصلنا آخر عنصر → نعرض لودينج بس، بدون نداء للدالة!
                        if (index == products.length) {
                          return Center(child: CircularProgressIndicator());
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
                      child: Center(child: Text(state.error)),
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
