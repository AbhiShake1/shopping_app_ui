import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_app_ui/core/providers/global_cart_item_count_provider.dart';
import 'package:shopping_app_ui/riverpod_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopping_app_ui/core/widgets/add_to_cart_animation/providers/cart_provider.dart';

import '../providers/cart_item_count_provider.dart';

class AddToCartAnimation extends HookWidget {
  const AddToCartAnimation({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 600),
        initialValue: context.read(addToCartRef(id)) ? 1 : 0);

    int _previousCount = 0;

    return Consumer(
      builder: (context, ref, child) {
        void handleAnimation() {
          int count = ref.watch(cartItemCountRef(id));
          if (count == 0) {
            controller.reverse();
            return;
          }
          //if decrement
          if (_previousCount > count) {
            controller.reverse().then((_) => controller.value = 1);
          } else {
            //if increment
            controller
              ..reset()
              ..forward();
          }
          _previousCount = count;
        }

        handleAnimation();
        return child!.badge(
          count: ref.watch(cartItemCountRef(id)),
          size: 20,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        );
      },
      child:
          Lottie.asset('assets/json/lottie/add_to_cart.json', controller: controller)
              .scale(scaleValue: 1.5),
    );
  }
}
