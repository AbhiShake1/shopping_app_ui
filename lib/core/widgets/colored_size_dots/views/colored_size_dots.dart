import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

part 'color_dot.dart';

class ColoredSizeDots extends StatelessWidget {
  const ColoredSizeDots({
    Key? key,
    required this.size,
  }) : super(key: key);

  final int size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Color'),
              Row(
                children: const [
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFF8C078)),
                  ColorDot(color: Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                'Size\n'.textSpan.make(),
                '$size cm'.textSpan.headline5(context).bold.make(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
