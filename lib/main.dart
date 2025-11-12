import 'package:app_food/core/bloc_observer.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/data/auth_repo.dart';
import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/sighup_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 👈 مهم جدًا

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
    Bloc.observer = MyBlocObserver();
  runApp(const AppFood());
}

class AppFood extends StatelessWidget {
  const AppFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthRepo())),
        // باقي الـ cubits هنا لو عندك
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppFood',
        theme: ThemeData(
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashView(),
      ),
    );
  }
}
