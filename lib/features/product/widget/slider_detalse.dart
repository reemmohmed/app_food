import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SliderDetalse extends StatelessWidget {
  const SliderDetalse({super.key, required this.valuel, this.onChanged});
  final double valuel;
  final Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/detels/product_detelse.png", height: 297),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitelTextWidget(
              text:
                  "Customize Your Burger\n to Your Tastes.\n Ultimate Experience",
            ),
            Gap(10),
            TitelTextWidget(text: "Spicy"),

            Slider(
              value: valuel,
              min: 0,
              max: 1,
              onChanged: onChanged,
              activeColor: AppColor.primary,
              inactiveColor: Colors.grey,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [Text("🥶"), Gap(150), Text("🌶️")],
            ),
          ],
        ),
      ],
    );
  }
}
