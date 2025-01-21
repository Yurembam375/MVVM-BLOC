import 'package:blocwitmvvm/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.password != current.password,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
              hintText: 'Password', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChange(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            //  return null;
            if (value.length < 6) {
              return 'please enter password greater than 6';
            }
            return null;
           // return null;
          },
          onFieldSubmitted: (value) {   
          },
        );
      },
    );
  }
}
