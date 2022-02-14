import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app_ui/riverpod_extensions.dart';
import 'package:shopping_app_ui/core/widgets/like_button/providers/like_state_provider.dart';

class LikeButton extends HookWidget {
  const LikeButton({Key? key, required this.id, this.onTap}) : super(key: key);

  final int id;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 600),
        initialValue: context.read(likeStateRef(id)) ? 1 : 0);
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Lottie.asset('assets/json/lottie/like.json', controller: controller),
      onTap: () {
        final isLiked = context.read(likeStateRef(id));
        isLiked ? controller.reset() : controller.forward();
        context.read(likeStateRef(id).notifier).flip();
        onTap?.call();
      },
    );
  }
}
