import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: emailFocusNode,
      decoration: const InputDecoration(
          hintText: 'Email', border: OutlineInputBorder()),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter email';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
