import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: onPress,
        child: Icon(icon),
      ),
    );
  }
}
