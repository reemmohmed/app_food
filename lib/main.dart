import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/sighup_view.dart';
import 'package:app_food/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppFood());
}

class AppFood extends StatelessWidget {
  const AppFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppFood',
      home: SighUpView(),
    );
  }
}
