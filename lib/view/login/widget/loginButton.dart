// import 'dart:developer';

// import 'package:blocwitmvvm/bloc/bloc/login_bloc.dart';
// import 'package:blocwitmvvm/utils/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Loginbutton extends StatelessWidget {
//   final formkey;
//   const Loginbutton({super.key, this.formkey});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginStates>(
//       listener: (context, state) {
//         if (state.postApiStatus == PostApiStatus.error) {
//           log(state.message.toString());
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(state.message.toString())));
//         }
//         if (state.postApiStatus == PostApiStatus.success) {
//           log(state.message.toString());
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(state.message.toString())));
//         }
//         if (state.postApiStatus == PostApiStatus.loading) {
//           log(state.message.toString());
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text("Submmiting")));
//         }
//       },
//       child: BlocBuilder<LoginBloc, LoginStates>(
//         buildWhen: (previous, current) => false,
//         builder: (context, state) {
//           return ElevatedButton(
//               onPressed: () {
//                 // if (formkey.currentState!.validate()) {
//                 //   // if (state.password.length < 6) {
//                 //   //   log('please enter pasworrd greater then 6');

//                 //   // }
//                 //   // log('i am here');
//                 //   context.read<LoginBloc>().add(LoginApi(),

//                 //   );
//                 // }
//                 log("yabra");
//               },
//               child: const Text("Login"));
//         },
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:blocwitmvvm/bloc/bloc/login_bloc.dart';
import 'package:blocwitmvvm/utils/enums.dart';
import 'package:blocwitmvvm/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginbutton extends StatelessWidget {
  final GlobalKey<FormState> formkey; // Enforce strong typing

  const Loginbutton({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        if (state.postApiStatus == PostApiStatus.error) {
          log(state.message.toString());
          FlushBarHelper.flushBarErrorMessage(
              state.message.toString(), context);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(state.message.toString())),
          // );
        } else if (state.postApiStatus == PostApiStatus.success) {
          FlushBarHelper.flushBarSucessMessage('Login Sucessful', context);
          log(state.message.toString());
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(state.message.toString())),
          // );
        }

        // else if (state.postApiStatus == PostApiStatus.loading) {
        //   log(state.message.toString());
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text("Submitting...")),
        //   );
        // }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              // if (formkey.currentState!.validate()) {
              //   if (state.password.length < 6) {
              //     log('Please enter a password with at least 6 characters');
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("Password must be at least 6 characters")),
              //     );
              //   } else {
              //     // Dispatch the LoginApi event

              //   }
              // }
              context.read<LoginBloc>().add(LoginApi());
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Login"),
          );
        },
      ),
    );
  }
}
