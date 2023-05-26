part of 'controllers.dart';

class HomeController extends GetxController {
  UserModel? user;

  Future<void> getUser() async {
    final response = await AuthService.getUser();

    if (response.value == null) {
      Get.snackbar(
          'Error', response.message ?? 'Terjadi kesalahan pada data User');
      return;
    }

    user = response.value!;
    update(['user']);
  }

  @override
  void onInit() {
    super.onInit();

    getUser();
  }
}
