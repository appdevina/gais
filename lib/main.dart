import 'package:flutter/material.dart';
import 'package:gais/pages/home/data_unittype_page.dart';
import 'package:gais/pages/home/profile_page.dart';
import 'package:gais/pages/sign_in_page.dart';
import 'package:gais/pages/splash_page.dart';
import 'package:gais/pages/home/main_page.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/home': (context) => MainPage(),
        '/profile': (context) => const ProfilePage(),
        '/unittype': (context) => const DataUnitTypePage(),
      },
    );
  }
}
