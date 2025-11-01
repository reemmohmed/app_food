
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';

class CustomCheckBooks extends StatelessWidget {
  const CustomCheckBooks({
    super.key,
    required this.value,
    this.onChanged,
    required this.text,
  });
  final bool value;
  final void Function(bool?)? onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.red,
          value: value,
          onChanged: onChanged,
        ),
        SubtitelTextWidget(text: text, fontSize: 16, color: Color(0xff808080)),
      ],
    );
  }
}
