import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/theme.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
