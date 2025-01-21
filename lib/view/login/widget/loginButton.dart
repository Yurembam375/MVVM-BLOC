import 'dart:developer';

import 'package:blocwitmvvm/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginbutton extends StatelessWidget {
  final formkey;
  const Loginbutton({super.key, this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                if (state.password.length < 6) {
                  log('please enter pasworrd greater then 6');
                }
                // log('i am here');
              }
            },
            child: const Text("Login"));
      },
    );
  }
}
