import 'package:app_food/core/constants/app_color.dart';
import 'package:flutter/cupertino.dart';

class CustomIconCart extends StatelessWidget {
  const CustomIconCart({super.key, this.onTap, required this.icon});
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.primary,
      ),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Icon(icon, color: Color(0xffffffff)),
        ),
      ),
    );
  }
}
