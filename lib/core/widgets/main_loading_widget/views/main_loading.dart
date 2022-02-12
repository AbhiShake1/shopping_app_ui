import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/json/lottie/main_loading_screen.json',
    );
  }
}
