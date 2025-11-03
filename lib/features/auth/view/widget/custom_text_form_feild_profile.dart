
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldProfile extends StatelessWidget {
  const CustomTextFormFieldProfile({
    super.key,
    required this.textEditingController,
    required this.text,
  });
  final String text;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.white,
      cursorHeight: 20,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        errorStyle: const TextStyle(
          fontSize: 18,
          color: Colors.red, // 👈 هيظهر بوضوح
          fontWeight: FontWeight.bold,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SubtitelTextWidget(text: text),
        ),

        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
