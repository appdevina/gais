part of 'controllers.dart';

class LoginController extends GetxController {
  TextEditingController? username, password;
  bool isLoading = false;

  Future<ApiReturnValue<bool>> login() async {
    isLoading = true;
    update(['button']);

    final response = await AuthService.login(
      username: username!.text.trim(),
      password: password!.text.trim(),
    );

    isLoading = false;
    update(['button']);

    return response;
  }

  Future<void> checkToken() async =>
      await AuthService.checkToken().then((response) => response.value ?? false
          ? Get.offAll(() => MainPage())
          : Get.offAll(() => SignInPage()));

  @override
  void onInit() async {
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
    checkToken();
  }
}
