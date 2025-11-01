import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_chech_books.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_list_titel.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_order_capitl.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_order_smal.dart';
import 'package:app_food/features/cart/widget/custom_cart_button_sheet.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/show_dilog.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';

import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderCheckOutView extends StatelessWidget {
  const OrderCheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitelTextWidget(
                text: "Order summary",
                fontWeight: FontWeight.w600,
              ),
              Gap(12),
              CustomOrderSmall(titel: "Order", price: "133 \$"),
              Gap(12),

              CustomOrderSmall(titel: "Taxes", price: "0.3 \$"),
              Gap(12),

              CustomOrderSmall(titel: "Delivery fees", price: "1.5 \$"),
              Gap(12),
              Divider(),
              CustomOrderCapitl(price: "18.19\$", tital: "Total"),
              Gap(12),
              CustomOrderCapitl(
                price: "15 - 30 mins",
                fontSize: 14,
                tital: "Estimated delivery time:",
              ),
              Gap(50),
              CustomListTitel(
                title: "Cash on delivery",
                iconPath: "assets/icons/dollar.png",
                value: "cash",
                groupValue: "cash",
                onChanged: (value) {},
              ),
              Gap(20),
              CustomListTitel(
                tileColor: Color(0xffF3F4F6),
                activeColor: Colors.white,
                title: "Debit card",
                titelcolor: Colors.black,
                sub: "3566 **** **** 0505",
                iconPath: "assets/icons/visa.png",
                value: "cash",
                groupValue: "cash",
                onChanged: (value) {},
              ),
              Gap(10),
              CustomCheckBooks(
                value: true,
                onChanged: (valu) {},
                text: "Save card details for future payments",
              ),
              Gap(300),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15)],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child: CustomCartButtonSheet(
          titelButton: "Pay Now",
          vertical: 20,
          horizontal: 25,
          price: "18.9",
          titel: "Total price ",
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return ShowDilog(
                  titel: "Success !",
                  sub:
                      "Your payment was successful\n.A receipt for this purchase\n has been sent to your email.",

                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
