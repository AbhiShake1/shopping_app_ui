import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app_ui/providers/brightness_provider.dart';
import 'package:shopping_app_ui/riverpod_extensions.dart';
import 'package:velocity_x/velocity_x.dart';

class ThemeSwitcher extends HookWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Lottie.asset(
        'assets/json/lottie/light_dark_theme.json',
        repeat: false,
        controller: controller,
      ),
      onTap: () {
        context.read(brightnessRef.notifier).flip();
        final isDark = context.read(brightnessRef) == Brightness.dark;
        if (isDark) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
    ).scale(scaleValue: 0.8);
  }
}
