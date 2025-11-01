import 'package:app_food/features/Order_CheckOut/views/order_check_out_view.dart';
import 'package:app_food/features/cart/widget/card_item.dart';
import 'package:app_food/features/cart/widget/custom_cart_button_sheet.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
      bottomSheet: CustomCartButtonSheet(
        price: "\$18.9",
        titel: "Total",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OrderCheckOutView();
              },
            ),
          );
        },
      ),
    );
  }
}
