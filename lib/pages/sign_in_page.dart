import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/pages/home/main_page.dart';
import 'package:get/get.dart';
import 'package:gais/theme.dart';
import 'package:gais/widgets/loading_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          //agar rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Sign in to continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Username',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_user.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      controller: controller.username,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Username',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_lock.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.password,
                      style: primaryTextStyle,
                      //merubah text menjadi bulat-bulat
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () => controller.login().then((response) =>
              response.value ?? false
                  ? Get.offAll(() => MainPage())
                  : Get.snackbar('error', response.message ?? 'Gagal Login')),
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign In',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                GetBuilder<LoginController>(
                  id: 'button',
                  builder: (controller) => controller.isLoading
                      ? const LoadingButton()
                      : signInButton(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
