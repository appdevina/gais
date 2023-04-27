import 'package:flutter/material.dart';
import 'package:gais/providers/auth_provider.dart';
import 'package:gais/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthProvider authProvider;

  checkToken() async {
    await authProvider.checkToken().then((value) {
      print(value);
      if (value) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    });
  }

  @override
  void initState() {
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.pushNamed(
    //     context,
    //     '/sign-in',
    //   ),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    checkToken();

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
