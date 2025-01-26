import 'package:blocwitmvvm/bloc/login_bloc/login_bloc.dart';
import 'package:blocwitmvvm/dependency_injection/locator.dart';

import 'package:blocwitmvvm/view/login/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  void dispose() {
    _loginBloc.close();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmailWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 20),
                PasswordWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height: 20),
                Center(
                  child: Loginbutton(
                    formkey: _formKey, // Pass formKey to Loginbutton
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
