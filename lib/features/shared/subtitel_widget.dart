
import 'package:flutter/material.dart';

class SubtitelTextWidget extends StatelessWidget {
  const SubtitelTextWidget(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 18,
      this.color,
      this.overflow = TextOverflow.ellipsis,
      this.fontStyle = FontStyle.normal,
      this.maxLines,
      this.decoration = TextDecoration.none,
      this.textAlign});
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
            overflow: overflow,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
            decoration: decoration));
  }
}
