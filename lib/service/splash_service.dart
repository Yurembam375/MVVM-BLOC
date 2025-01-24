import 'dart:async';

import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:blocwitmvvm/service/session_manager/session_manager.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    SessionManager().getUserFromPreference().then((value) {
      if (SessionManager().isLogin ?? false) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.restorablePushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.restorablePushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError(
      (error, stackTrace) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.restorablePushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      },
    );
  }
}
