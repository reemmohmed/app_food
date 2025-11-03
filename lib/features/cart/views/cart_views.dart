import 'package:app_food/features/Order_CheckOut/views/order_check_out_view.dart';
import 'package:app_food/features/cart/widget/card_item.dart';
import 'package:app_food/features/cart/widget/custom_cart_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                padding: const EdgeInsets.only(top: 20, bottom: 500),
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
      bottomSheet: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),

        child: CustomCartButtonSheet(
          price: "18.9",
          titel: "Total",
          titelButton: "Checkout",
          vertical: 20,
          horizontal: 25,

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
      ),
    );
  }
}
