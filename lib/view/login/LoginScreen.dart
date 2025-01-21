import 'package:blocwitmvvm/bloc/bloc/login_bloc.dart';
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

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailWidget(emailFocusNode: emailFocusNode),
              const SizedBox(
                height: 20,
              ),
              PasswordWidget(passwordFocusNode: passwordFocusNode),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Loginbutton(
                formkey: _formkey,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
