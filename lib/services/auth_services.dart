part of 'services.dart';

class AuthService {
  static Future<ApiReturnValue<bool>> login({
    required String username,
    required String password,
  }) async {
    final response = await ApiService().post('${ApiUrl.baseUrl}/login',
        headers: ApiUrl.defaultHeader,
        body: {'username': username, 'password': password});
    if (response.value != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(
          'token', 'Bearer ${response.value['data']['access_token']}');
    }

    return ApiReturnValue(
        value: response.value != null, message: response.message);
  }

  static Future<ApiReturnValue<bool>> checkToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('token') == null) {
      return ApiReturnValue(value: false, message: 'Silahkan login');
    }

    final response = await ApiService().get(
      '${ApiUrl.baseUrl}/user',
      headers: await ApiUrl.headerWithToken(),
    );

    return ApiReturnValue(
        value: response.value != null, message: response.message);
  }

  static Future<ApiReturnValue<UserModel>> getUser() async {
    final response = await ApiService().get(
      '${ApiUrl.baseUrl}/user',
      headers: await ApiUrl.headerWithToken(),
    );

    if (response.value == null) {
      return ApiReturnValue(value: null, message: response.value);
    }

    final user = UserModel.fromJson(response.value['data']);

    return ApiReturnValue(value: user);
  }
}
