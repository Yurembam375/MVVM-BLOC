import 'package:blocwitmvvm/config/color/colors.dart';
import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final String tittle;
  final VoidCallback onPress;
  final double height;
  const Roundbutton(
      {super.key,
      required this.tittle,
      required this.onPress,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: const BoxDecoration(color: AppColors.buttonColor),
        child: Center(
          child: Text(tittle),
        ),
      ),
    );
  }
}
