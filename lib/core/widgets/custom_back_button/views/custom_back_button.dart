import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Lottie.asset(
        'assets/json/lottie/back-arrow.json',
      ).scale(scaleValue: 0.6),
      onTap: context.pop,
    );
  }
}
