import 'package:flutter/material.dart';

class TitelTextWidget extends StatelessWidget {
  const TitelTextWidget({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 20,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.fontStyle = FontStyle.normal,
    this.maxLines = 2,
    this.decoration = TextDecoration.none,
  });
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textScaler: TextScaler.linear(1.0),
      style: TextStyle(
        textBaseline: TextBaseline.alphabetic,
        overflow: overflow,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
        decoration: decoration,
      ),
    );
  }
}
