import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/product/widget/slider_detalse.dart';
import 'package:app_food/features/product/widget/topping_detelse.dart';
import 'package:app_food/features/shared/custom_button.dart';
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
                  children: List.generate(10, (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  children: List.generate(10, (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ToppingDetelse(
                        imagepath: "assets/detels/tomato.png",
                        titel: "Tomato",
                      ),
                    );
                  }),
                ),
              ),

              Gap(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitelTextWidget(
                        text: "Total",

                        fontWeight: FontWeight.w700,
                        color: Color(0xff3C2F2F),
                      ),
                      SubtitelTextWidget(
                        text: "\$18.19",
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3C2F2F),
                      ),
                    ],
                  ),
                  CustomButton(titel: "Add To Cart"),
                ],
              ),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
