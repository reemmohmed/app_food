import 'dart:developer';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/auth/view/sighup_view.dart';
import 'package:app_food/features/auth/view/widget/custom_auth_button.dart';
import 'package:app_food/features/root.dart';
import 'package:app_food/features/shared/custom-text_form.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';

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
        backgroundColor: Colors.white,
        body: Form(
          key: form,
          child: Center(
            child: Column(
              children: [
                Gap(80),
                SvgPicture.asset(
                  "assets/splash/Hungry_.svg",
                  color: Colors.black,
                ),

                SubtitelTextWidget(
                  text: "Wellcom to visit an AppFood 👋👋",
                  color: Colors.black,
                ),
                Gap(100),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 25, color: Colors.grey),
                      ],
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          CustomAuthButton(
                            text: "Login",
                            onTap: () {
                              if (form.currentState!.validate()) {
                                log("Sucess");
                              }
                            },
                          ),
                          Gap(30),
                          CustomAuthButton(
                            text: "creat an account ? SinghUp ",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SighUpView();
                                  },
                                ),
                              );
                            },
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Root();
                                },
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: SubtitelTextWidget(
                                text: "Gest in App ",
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Gap(20),
                        ],
                      ),
                    ),
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
