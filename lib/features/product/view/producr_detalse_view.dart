import 'package:app_food/features/Order_CheckOut/views/order_check_out_view.dart';
import 'package:app_food/features/cart/widget/custom_cart_button_sheet.dart';
import 'package:app_food/features/product/widget/slider_detalse.dart';
import 'package:app_food/features/product/widget/topping_detelse.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProducrDetalseView extends StatelessWidget {
  const ProducrDetalseView({super.key, this.productId});
  final productId; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderDetalse(valuel: 1, onChanged: (v) {}),
              TitelTextWidget(text: "Toppings"),
              Gap(50),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ToppingDetelse(
                        imagepath: "assets/detels/tomato.png",
                        titel: "Tomato",
                      ),
                    );
                  }),
                ),
              ),
              Gap(70),
              TitelTextWidget(text: "Side options"),
              Gap(50),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ToppingDetelse(
                        imagepath: "assets/detels/tomato.png",
                        titel: "Tomato",
                      ),
                    );
                  }),
                ),
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
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),

        child: CustomCartButtonSheet(
          price: "18.9",
          titel: "Total",

          titelButton: "AddTocard",
          vertical: 20,
          horizontal: 25,
          // it must go a Card so i want a customize a arowback in the card
          // if user go in here moust see a preapre a arowbace
          // also not prearear
          onTap: () {},
        ),
      ),
    );
  }
}
