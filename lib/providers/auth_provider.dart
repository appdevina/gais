import 'package:flutter/material.dart';
import 'package:gais/models/user_model.dart';
import 'package:gais/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  List<UserModel> _users = [];

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );
      _user = user;

      //menambahkan user ke list users
      _users.add(user);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> checkToken() async {
    try {
      UserModel? user = await AuthService().checkToken();
      if (user != null) {
        _user = user;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
