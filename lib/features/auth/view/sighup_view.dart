import 'dart:developer';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/core/functin_app.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/widget/custom_auth_button.dart';
import 'package:app_food/features/root.dart';
import 'package:app_food/features/shared/custom-text_form.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SighUpView extends StatelessWidget {
  const SighUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
        TextEditingController();
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
                Gap(10),
                SubtitelTextWidget(text: "Wellcom to App Food 👋👋"),
                Gap(100),
                Expanded(
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        authDialow(context);
                      } else if (state is AuthSuccess) {
                        Navigator.pop(context); // close loading dialog
                        log("✅ Login success: ${state.user.name}");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const Root()),
                        );
                      } else if (state is AuthFailure) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            closeIconColor: Colors.red,
                            content: SubtitelTextWidget(
                              text: " ${state.error}",
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.all(20),
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
                                hintText: "name",
                                controller: nameController,
                                textInputAction: TextInputAction.next,
                              ),
                              Gap(20),
                              CustomTextForm(
                                textInputAction: TextInputAction.next,
                                hintText: "email adress",
                                controller: emailController,
                              ),
                              Gap(20),
                              CustomTextForm(
                                textInputAction: TextInputAction.done,
                                hintText: "password",
                                controller: passwordController,
                                passwordobscureText: true,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(
                                    context,
                                  ).unfocus(); // 👈 يقفل الكيبورد
                                  if (form.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                              ),

                              Gap(30),
                              CustomAuthButton(
                                text: "Sighup",
                                onTap: () {
                                  if (form.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                              Gap(30),
                              CustomAuthButton(
                                text: "Aredy Have an account ? Login ",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoginView();
                                      },
                                    ),
                                  );
                                },
                              ),
                              Gap(300),
                            ],
                          ),
                        ),
                      );
                    },
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
