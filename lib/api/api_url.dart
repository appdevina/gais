import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
  static const String baseUrl = "http://192.168.1.12:8000/api";

  static Map<String, String> defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static Future<Map<String, String>> headerWithToken() async {
    final pref = await SharedPreferences.getInstance();

    var header = defaultHeader;

    header.addAll({'Authorization': pref.getString('token') ?? ''});

    return header;
  }
}
