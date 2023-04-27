import 'package:flutter/material.dart';
import 'package:gais/pages/home/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:gais/pages/home/home_page.dart';
import 'package:gais/providers/page_provider.dart';
import 'package:gais/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static DateTime? currentBackPressTime;

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? now) >
            const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: alerrColor,
          content: Text(
            'Tekan sekali lagi untuk keluar dari aplikasi',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_user.png',
                    width: 21,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : Color(0xff808191),
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
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return HomePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: WillPopScope(onWillPop: () => onWillPop(context), child: body()),
    );
  }
}
