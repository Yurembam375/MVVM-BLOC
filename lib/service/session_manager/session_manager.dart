import 'dart:convert';

import 'package:blocwitmvvm/config/model/user/user_model.dart';
import 'package:blocwitmvvm/service/storage/local_storage.dart';
import 'package:flutter/material.dart';

class SessionManager {
  static final SessionManager _seesion = SessionManager._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;
  SessionManager._internal() {
    isLogin = false;
  }
  factory SessionManager() {
    return _seesion;
  }

  Future<void> saveUserInPrefence(dynamic user) async {
    localStorage.setValue("token", jsonEncode(user));
    localStorage.setValue("isLogin", 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if (userData.isNotEmpty) {
        SessionManager().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionManager().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
