import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/sighup_view.dart';
import 'package:app_food/features/root.dart';
import 'package:app_food/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // rotation
  // 🔒 قفل الاتجاه على الوضع الطولي فقط
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, // يعني الطولي العادي فقط
  // ]);
  runApp(const AppFood());
}

class AppFood extends StatelessWidget {
  const AppFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppFood',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashView(),
    );
  }
}
