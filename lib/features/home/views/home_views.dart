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
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final homecubit =context.read<HomeCubit>().fetchCategories();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              elevation: 0,

              toolbarHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      UserHeader(usernane: "User"),
                      Gap(10),
                      SearchApp(),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                  if (state is HomeLoading || state is HomeInitial) {
      return const CategoryShimmer();
                    } else if (state is HomeSuccess) {
                      final categories = state.categories
                          .map((e) => e.name)
                          .toList();
                      return CatogeryItem(
                        catogetry: categories,
                        selectIndex: selectIndex,
                      );
                    } else if (state is HomeFailure) {
                      return Center(child: Text(state.error));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              sliver: SliverGrid.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.87,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) {
                          return ProducrDetalseView();
                        },
                      ),
                    ),
                    child: CardItem(
                      image: "assets/splash/image 1.png",
                      rate: "4.9",
                      subtitel: "Wendy's Burger",
                      titel: "Cheeseburger",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
