import 'dart:developer';
import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/core/functin_app.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/view/sighup_view.dart';
import 'package:app_food/features/auth/view/widget/custom_auth_button.dart';
import 'package:app_food/features/root.dart';
import 'package:app_food/features/shared/custom-text_form.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return Center(
                child: Column(
                  children: [
                    const Gap(80),
                    SvgPicture.asset(
                      "assets/splash/Hungry_.svg",
                      color: Colors.black,
                    ),
                    const SubtitelTextWidget(
                      text: "Welcome to visit AppFood 👋👋",
                      color: Colors.black,
                    ),
                    const Gap(100),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 25, color: Colors.grey),
                          ],
                          color: AppColor.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Gap(50),
                              CustomTextForm(
                                hintText: "Email Address",
                                controller: emailController,
                              ),
                              const Gap(25),
                              CustomTextForm(
                                hintText: "Password",
                                controller: passwordController,
                                passwordobscureText: true,
                              ),
                              const Gap(30),

                              // 🔹 هنا بنربط زرار login بالـ Cubit
                              CustomAuthButton(
                                text: "Login",
                                onTap: () {
                                  if (form.currentState!.validate()) {
                                    // final data = {
                                    //   "email": emailController.text.trim(),
                                    //   "password": passwordController.text
                                    //       .trim(),
                                    // };
                                    context.read<AuthCubit>().login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),

                              const Gap(30),
                              CustomAuthButton(
                                text: "Create an account? Sign Up",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SighUpView(),
                                    ),
                                  );
                                },
                              ),

                              const Gap(10),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Root(),
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                  child: SubtitelTextWidget(
                                    text: "Guest in App",
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
