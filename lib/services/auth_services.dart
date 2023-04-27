import 'dart:convert';

import 'package:gais/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://sumo.completeselular.com:3990/api';

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var body = jsonEncode({'username': username, 'password': password});

    //variabel untuk request ke backend menggunakan http
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);
    print('berhasil login');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', 'Bearer ${data['access_token']}');

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel?> checkToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('token') == null) {
      return null;
    }

    print(pref.getString('token'));
    var url = '$baseUrl/user';
    var headers = {
      'Authorization': pref.getString('token') ?? '',
      'Content-Type': 'application/json'
    };

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data);
        user.token = 'Bearer ${data['access_token']}';

        return user;
      } else {
        pref.clear();
        return null;
      }
    } catch (e) {
      pref.clear();
      return null;
    }
  }
}
