import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/home/views/widget/card_item.dart';
import 'package:app_food/features/home/views/widget/catogery_item.dart';
import 'package:app_food/features/home/views/widget/saerch_app.dart';
import 'package:app_food/features/home/views/widget/user_header.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  List<String> catogetry = ["all", "Burger", "Pizza", "Salad", "Drinks"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    CatogeryItem(
                      catogetry: catogetry,
                      selectIndex: selectIndex,
                    ),
                  ],
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
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) {
                  return CardItem(
                    image: "assets/splash/image 1.png",
                    rate: "4.9",
                    subtitel: "Wendy's Burger",
                    titel: "Cheeseburger",
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
