import 'package:flutter/material.dart';
import 'package:gais/pages/home/data_unittype_page.dart';
import 'package:gais/pages/home/profile_page.dart';
import 'package:gais/pages/sign_in_page.dart';
import 'package:gais/pages/splash_page.dart';
import 'package:gais/pages/home/main_page.dart';
import 'package:gais/providers/auth_provider.dart';
import 'package:gais/providers/page_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/home': (context) => MainPage(),
          '/profile': (context) => ProfilePage(),
          '/unittype': (context) => DataUnitTypePage(),
        },
      ),
    );
  }
}
