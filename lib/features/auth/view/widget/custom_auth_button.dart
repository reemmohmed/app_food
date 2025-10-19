import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(child: TitelTextWidget(text: text)),
      ),
    );
  }
}
