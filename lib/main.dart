import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:blocwitmvvm/config/routes/routes.dart';
import 'package:blocwitmvvm/repository/auth/login_http_api_repo.dart';
import 'package:blocwitmvvm/repository/auth/login_repo.dart';
import 'package:blocwitmvvm/view/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
      home: Splashscreen(),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepo>(() => LoginHttpApiRepo());
}
