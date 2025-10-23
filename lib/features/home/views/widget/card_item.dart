import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.titel,
    required this.subtitel,
    required this.rate,
  });
  final String image, titel, subtitel;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 40),
      color: Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            TitelTextWidget(text: titel),
            SubtitelTextWidget(text: subtitel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubtitelTextWidget(text: "⭐️ $rate"),
                Icon(CupertinoIcons.heart_fill, color: AppColor.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
