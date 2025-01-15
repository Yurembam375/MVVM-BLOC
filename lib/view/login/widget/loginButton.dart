import 'dart:developer';

import 'package:flutter/material.dart';

class Loginbutton extends StatelessWidget {
  final formkey;
  const Loginbutton({super.key, this.formkey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            log('i am here');
          }
        },
        child: const Text("Login"));
  }
}
