import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/theme.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return GetBuilder<HomeController>(
        id: 'user',
        builder: (controller) => AppBar(
          backgroundColor: backgroundColor1,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
              child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: controller.user?.profilePhotoUrl != null
                      ? Image.network(
                          controller.user!.profilePhotoUrl!,
                        )
                      : Image.asset(
                          'assets/image_profile.png',
                        ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Helo, ${controller.user?.fullname ?? '-'}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '@${controller.user?.username ?? '-'}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/button_exit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStye.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              menuItem(
                'Your Orders',
              ),
              menuItem(
                'Help',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Privacy & Policy',
              ),
              menuItem(
                'Terms of Services',
              ),
              menuItem(
                'Rate App',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
