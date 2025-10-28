import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/product/widget/slider_detalse.dart';
import 'package:app_food/features/product/widget/topping_detelse.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProducrDetalseView extends StatelessWidget {
  const ProducrDetalseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderDetalse(valuel: 1, onChanged: (v) {}),
            TitelTextWidget(text: "Toppings"),
            Gap(50),
            Center(child: ToppingDetelse()),
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  // ظل ناعم أسفل الصورة فقط
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: const Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: -9,
                  ),
                ],
              ),
              child: Image.asset(
                "assets/detels/tomato.png",
                width: 55,
                height: 45.91,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
