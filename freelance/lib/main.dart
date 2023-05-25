import 'package:flutter/material.dart';
import 'package:freelance/layouts/bottom_bar.dart';
import 'package:freelance/layouts/login.dart';
import 'package:freelance/layouts/register.dart';
import 'package:freelance/layouts/splash_screen.dart';
import 'package:freelance/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primaryColor: primary,
  //     ),
  //     home: const BottomBar(),
  //   );
  // }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: primary,
              ),
              //home: const BottomBar(),
              home: const LoginPage(),
              //home: const RegisterPage(),
            );
          }
        });
  }
}
