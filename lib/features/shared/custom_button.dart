import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.titel});
  final void Function()? onTap;
  final String titel; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.primary,
        ),
        child: SubtitelTextWidget(
          text: titel,
          color: Color(0xffFFFFFF),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
