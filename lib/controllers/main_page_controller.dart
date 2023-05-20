part of 'controllers.dart';

class MainPageController extends GetxController {
  Rx<int> pageIndex = 0.obs;
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
          content: const Text(
            'Tekan sekali lagi untuk keluar dari aplikasi',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
