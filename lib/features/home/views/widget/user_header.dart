import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key, required this.usernane});
  final String usernane;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            SvgPicture.asset(
              "assets/splash/Hungry_.svg",

              color: AppColor.primary,
            ),
            SubtitelTextWidget(text: "Hellow $usernane"),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColor.primary,
          child: Icon(CupertinoIcons.person, color: Colors.white),
        ),
      ],
    );
  }
}
