import 'package:flutter/material.dart';
import 'package:gais/controllers/controllers.dart';
import 'package:gais/pages/home/home_page.dart';
import 'package:gais/theme.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final mainPageController = Get.put(MainPageController());

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_add.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav(MainPageController controller) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: controller.pageIndex.value,
            onTap: (value) {
              print(value);
              controller.pageIndex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: controller.pageIndex.value == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_user.png',
                    width: 21,
                    color: controller.pageIndex.value == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (mainPageController.pageIndex.value) {
        case 0:
          return HomePage();
        case 1:
          return HomePage();
        default:
          return HomePage();
      }
    }

    return GetBuilder<MainPageController>(
      builder: (controller) => Scaffold(
        backgroundColor: controller.pageIndex.value == 0
            ? backgroundColor1
            : backgroundColor3,
        floatingActionButton: addButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customButtonNav(controller),
        body: WillPopScope(
            onWillPop: () => controller.onWillPop(context), child: body()),
      ),
    );
  }
}
