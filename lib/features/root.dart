import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/auth/view/profile_view.dart';
import 'package:app_food/features/cart/views/cart_views.dart';
import 'package:app_food/features/home/views/home_views.dart';
import 'package:app_food/features/orderhistory/views/order_history_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> pages;
  late int curntScreen = 0;
  late PageController controller;

  @override
  void initState() {
    pages = [HomeViews(), CartView(), OrderHistoryViews(), ProfileView()];
    controller = PageController(initialPage: curntScreen);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.primary,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() => curntScreen = index);
            controller.jumpToPage(curntScreen);
          },

          currentIndex: curntScreen,
          backgroundColor: Colors.transparent,

          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: "cart",
              icon: Icon(CupertinoIcons.cart),
            ),
            BottomNavigationBarItem(
              label: "Orders",
              icon: Icon(Icons.local_restaurant),
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(CupertinoIcons.profile_circled),
            ),
          ],
        ),
      ),
      body: PageView(controller: controller, children: pages),
    );
  }
}
