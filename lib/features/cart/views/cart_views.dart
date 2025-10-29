import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/cart/widget/card_item.dart';
import 'package:app_food/features/cart/widget/custom_cart_button_sheet.dart';
import 'package:app_food/features/cart/widget/custom_icon_cart.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CardItemcart(
                      imagepath: "assets/splash/image 1.png",
                      titel: "Hamburger",
                      sub: "veggie Burger",
                      number: 1,
                      onTapadd: () {},
                      onTapremove: () {},
                      remove: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: CustomCartButtonSheet(
        price: "\$18.9",
        titel: "Total",
        onTap: () {},
      ),
    );
  }
}
