
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';

class CustomOrderSmall extends StatelessWidget {
  const CustomOrderSmall({super.key, required this.titel, required this.price});
  final String titel;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubtitelTextWidget(text: titel, color: Color(0xff7D7D7D)),
          SubtitelTextWidget(text: price, color: Color(0xff7D7D7D)),
        ],
      ),
    );
  }
}
