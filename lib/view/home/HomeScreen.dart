import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:blocwitmvvm/service/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      LocalStorage localStorage = LocalStorage();
      await localStorage.clearValue('token');
      await localStorage.clearValue('isLogin');
      Navigator.pushNamed(context, RoutesName.loginScreen);
    } catch (e) {
      // Handle error (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
