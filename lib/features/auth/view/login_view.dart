import 'dart:developer';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/custom-text_form.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: form,
            child: Column(
              children: [
                Gap(80),
                SvgPicture.asset("assets/splash/Hungry_.svg"),

                SubtitelTextWidget(
                  text: "Wellcom to visit an AppFood",
                  color: Colors.white,
                ),
                Gap(50),
                CustomTextForm(
                  hintText: "Email Adrees",
                  controller: emailController,
                ),

                Gap(25),
                CustomTextForm(
                  hintText: "password",
                  controller: passwordController,
                  passwordobscureText: true,
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    if (form.currentState!.validate()) {
                      log("sUCESS");
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Center(child: TitelTextWidget(text: "Login")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
