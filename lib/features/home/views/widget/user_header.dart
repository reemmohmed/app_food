import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
    required this.username,
    required this.userImage,
  });
  final String username;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            SubtitelTextWidget(text: "Hellow $username"),
          ],
        ),
        ClipOval(
          child: userImage == null || userImage!.isEmpty
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: size.width * 0.16,
                    height: size.width * 0.16,
                    color: Colors.grey.shade300,
                  ),
                )
              : CircleAvatar(
                  radius: size.width * 0.08,
                  backgroundImage: NetworkImage(userImage!),
                ),
        ),
      ],
    );
  }
}
