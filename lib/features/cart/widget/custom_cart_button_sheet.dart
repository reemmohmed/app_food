import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';

class CustomCartButtonSheet extends StatelessWidget {
  const CustomCartButtonSheet({
    super.key,
    required this.titel,
    required this.titelButton,
    required this.price,
    this.colorcontdecoration = Colors.white,
    this.onTap,
    this.horizontal = 18,
    this.vertical = 16,
    this.hight = 50,
  });

  final String titel;
  final String titelButton;
  final double hight;
  final String price;
  final double horizontal;
  final double vertical;
  final void Function()? onTap;
  final Color colorcontdecoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        color: colorcontdecoration,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, //
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // م
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitelTextWidget(
                  text: titel,

                  fontWeight: FontWeight.w700,
                  color: Color(0xff3C2F2F),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$', // رمز الدولار
                        style: TextStyle(
                          color: Colors.green, // اللون الأخضر

                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: price, // باقي السعر
                        style: TextStyle(
                          color: Color(0xff3C2F2F),
                          fontWeight: FontWeight.w600,
                          // اللون العادي
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                // if price duleeer not fond in api price
                // SubtitelTextWidget(
                //   text: price,
                //   fontSize: 30,
                //   fontWeight: FontWeight.w600,
                //   color: Color(0xff3C2F2F),
                // ),
              ],
            ),
            // it must go a Card so i want a customize a arowback in the card
            // if user go in here moust see a preapre a arowbace
            // also not prearear
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: CustomButton(
                titel: titelButton,

                horizontal: horizontal,
                vertical: vertical,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
