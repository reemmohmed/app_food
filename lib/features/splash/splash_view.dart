import 'package:app_food/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          children: [
            Gap(290),
            SvgPicture.asset("assets/splash/Hungry_.svg"),
            Spacer(),
            Image.asset("assets/splash/image 1.png"),
            
          ],
        ),
      ),
    );
  }
}
