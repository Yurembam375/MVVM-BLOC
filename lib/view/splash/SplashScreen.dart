import 'package:blocwitmvvm/data/exception/appException.dart';
import 'package:blocwitmvvm/data/service/splash_service.dart';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final SplashService _splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInterntException("No Internet exception");
        },
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [

              Text("Splash Screen")
              // const Loadingwidget(),
              // Roundbutton(
              //   tittle: "Login",
              //   onPress: () {},
              //  // height: 100,
              // ),
              // Roundbutton(
              //   tittle: "Sigin up",
              //   onPress: () {},
              //  // height: 100,
              // ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, RoutesName.homeScreen);
              //     },
              //     child: const Text("Home")),
              // Internetexceptionwidget()
            ],
          ),
        ),
      ),
    );
  }
}
