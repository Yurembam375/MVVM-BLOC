import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:blocwitmvvm/config/routes/routes.dart';
import 'package:blocwitmvvm/dependency_injection/locator.dart';

import 'package:blocwitmvvm/view/home/HomeScreen.dart';
import 'package:flutter/material.dart';

ServiceLocator dependency_injection = ServiceLocator();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependency_injection.servicesLocator();
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
      home: HomeScreen(),
    );
  }
}
