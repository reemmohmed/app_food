import 'package:app_food/features/orderhistory/views/widgets/image_shadow.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderHistoryViews extends StatelessWidget {
  const OrderHistoryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ImageShadow(
                                imagepath: "assets/splash/image 1.png",
                              ),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                SubtitelTextWidget(
                                  text: "Hamburger veggie Burger",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                SubtitelTextWidget(
                                  text: "Quinty : x4",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                SubtitelTextWidget(
                                  text: "price: \$20",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                Gap(10),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        titel: "Order Agin",
                        horizontal: 40,
                        vertical: 12,
                        color: Colors.grey.shade300,
                        width:
                            double.infinity, // خليه ياخد الحجم على قد المحتوى
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
