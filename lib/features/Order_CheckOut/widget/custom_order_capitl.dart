
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomOrderCapitl extends StatelessWidget {
  const CustomOrderCapitl({
    super.key,
    this.fontSize = 18,
    required this.tital,
    required this.price,
  });
  final double? fontSize;
  final String tital;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitelTextWidget(text: tital, fontSize: fontSize),
        TitelTextWidget(text: price, fontSize: fontSize),
      ],
    );
  }
}
