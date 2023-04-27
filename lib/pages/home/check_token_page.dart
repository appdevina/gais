import 'package:flutter/material.dart';
import 'package:gais/pages/home/main_page.dart';
import 'package:gais/pages/sign_in_page.dart';
import 'package:gais/services/auth_services.dart';

class CheckTokenPage extends StatelessWidget {
  const CheckTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: FutureBuilder(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return MainPage();
        //     } else {
        //       return SignInPage();
        //     }
        //   },
        //   future: AuthService().checkToken(),
        // ),
        );
  }
}
