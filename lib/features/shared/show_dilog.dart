
import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/custom_button.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShowDilog extends StatelessWidget {
  const ShowDilog({
    super.key,
    required this.titel,
    required this.sub,
    this.onTap,
  });
  final String titel;
  final String sub;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Dialog(
        backgroundColor: Color(0xffFFF9F9),
        shadowColor: Colors.red,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 30,
                child: Icon(Icons.check, color: Colors.white, size: 25),
              ),
              Gap(20),
              TitelTextWidget(text: titel),
              Gap(10),
              SubtitelTextWidget(
                text: sub,
                color: Color(0xffBCBBBB),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Gap(40),
              CustomButton(horizontal: 70, titel: "Go Back", onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
