
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';

class CustomCartButtonSheet extends StatelessWidget {
  const CustomCartButtonSheet({
    super.key,
    required this.titel,
    required this.price,
    this.onTap,
  });

  final String titel;
  final String price;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        color: Colors.white10,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitelTextWidget(
                  text: titel,

                  fontWeight: FontWeight.w700,
                  color: Color(0xff3C2F2F),
                ),
                SubtitelTextWidget(
                  text: price,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3C2F2F),
                ),
              ],
            ),
            // it must go a Card so i want a customize a arowback in the card
            // if user go in here moust see a preapre a arowbace
            // also not prearear
            CustomButton(
              titel: "Checkout",
              vertical: 20,
              horizontal: 30,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
