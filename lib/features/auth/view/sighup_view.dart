import 'dart:developer';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/auth/view/widget/custom_auth_button.dart';
import 'package:app_food/features/shared/custom-text_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SighUpView extends StatelessWidget {
  const SighUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController conFirmpasswordController =
        TextEditingController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: form,
            child: Center(
              child: Column(
                children: [
                  Gap(80),
                  SvgPicture.asset("assets/splash/Hungry_.svg"),

                  Gap(25),
                  CustomTextForm(hintText: "name", controller: nameController),
                  Gap(15),
                  CustomTextForm(
                    hintText: "email adress",
                    controller: emailController,
                  ),
                  Gap(15),
                  CustomTextForm(
                    hintText: "password",
                    controller: passwordController,
                    passwordobscureText: true,
                  ),

                  Gap(15),
                  CustomTextForm(
                    hintText: "Confirmpassword",
                    controller: conFirmpasswordController,
                    passwordobscureText: true,
                  ),
                  Gap(30),
                  CustomAuthButton(
                    text: "Sighup",
                    onTap: () {
                      if (form.currentState!.validate()) {
                        log('Sucsess');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
