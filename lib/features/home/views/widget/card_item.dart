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
      shadowColor: Colors.grey,
      // margin: EdgeInsets.only(top: 40),
      elevation: 10,

      color: Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(image, height: 121, width: 120)),
            TitelTextWidget(text: titel),
            SubtitelTextWidget(text: subtitel, maxLines: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubtitelTextWidget(text: "⭐️ $rate"),
                Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.deepOrangeAccent.shade700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
