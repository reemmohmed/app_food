import 'package:app_food/features/cart/widget/custom_icon_cart.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItemcart extends StatelessWidget {
  const CardItemcart({
    super.key,
    required this.imagepath,
    required this.titel,
    required this.sub,
    required this.number,
    this.onTapremove,
    this.onTapadd,
    this.remove,
  });
  final String imagepath;
  final String titel, sub;
  final int number;
  final void Function()? onTapremove;
  final void Function()? onTapadd;
  final void Function()? remove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        color: Color(0xffFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        // ظل ناعم أسفل الصورة فقط
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          offset: const Offset(0, 8),
                          blurRadius: 1,
                          spreadRadius: -17,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/splash/image 1.png",
                      width: 100,
                      height: 102,
                    ),
                  ),

                  SubtitelTextWidget(
                    text: titel,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SubtitelTextWidget(
                    text: sub,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
               
               
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CustomIconCart(icon: Icons.add, onTap: onTapadd),
                      Gap(25),
                      SubtitelTextWidget(
                        text: number.toString(),
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      Gap(25),
                      CustomIconCart(icon: Icons.remove, onTap: onTapremove),
                    ],
                  ),
                ),
                Gap(36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    titel: "Remove",
                    horizontal: 35,
                    vertical: 10,
                    onTap: remove,
                  ),
                ),
                Gap(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
