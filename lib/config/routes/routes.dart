import 'package:blocwitmvvm/config/routes/routeName.dart';

import 'package:flutter/material.dart';

import '../../view/view.dart';



class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const Splashscreen(),
        );
          case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
          case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>  const Loginscreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route generate"),
              ),
            );
          },
        );
    }
  }
}
