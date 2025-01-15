import 'dart:async';

import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.restorablePushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false));
  }
}
