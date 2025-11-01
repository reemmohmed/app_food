
import 'package:flutter/material.dart';

class ImageShadow extends StatelessWidget {
  const ImageShadow({super.key, required this.imagepath});
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Image.asset(imagepath, width: 100, height: 102),
    );
  }
}
