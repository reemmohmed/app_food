
import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 🔹 إعداد الأنيميشن
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);

    // 🔹 استدعاء autoLogin بعد بناء الويدجت
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().autoLogin();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Root()),
          );
        } else if (state is AuthInitial || state is AuthFailure) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
          child: Column(
            children: [
              const Gap(290),
              ScaleTransition(
                scale: _scaleAnimation,
                child: SvgPicture.asset("assets/splash/Hungry_.svg"),
              ),
              const Spacer(),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset("assets/splash/image 1.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
