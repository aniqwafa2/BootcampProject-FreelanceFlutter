import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freelance/layouts/bottom_bar.dart';
import 'package:freelance/layouts/login.dart';
import 'package:freelance/layouts/register.dart';
import 'package:freelance/layouts/splash_screen.dart';
import 'package:freelance/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return MaterialApp(
              scrollBehavior: MyCustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              title: 'Freelance App',
              theme: ThemeData(
                primaryColor: primary,
              ),
              //home: const BottomBar(),
              home: const LoginPage(),
              // home: const RegisterPage(),
            );
          }
        });
  }
}
