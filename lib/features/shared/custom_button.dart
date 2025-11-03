import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.titel,
    this.horizontal = 18,
    this.vertical = 16,
    // this.height = 50,
    this.width,
    this.color,
  });
  final void Function()? onTap;
  final double horizontal;
  final double vertical;
  final String titel;
  final double? width;
  final Color? color;
  // final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? AppColor.primary,
        ),
        child: Center(
          child: SubtitelTextWidget(
            text: titel,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
