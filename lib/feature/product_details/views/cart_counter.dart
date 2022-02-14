part of 'product_details_screen.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOutlineButton(
          icon: Icons.remove,
          onPress: () {
            context.read(cartItemCountRef(id).notifier).decrement();
          },
        ),
        Consumer(
          builder: (_, ref, __) => '${ref.watch(cartItemCountRef(id))}'
              //if less than 10, show 01,02...
              .padLeft(2, "0")
              .text
              .headline6(context)
              .make()
              .px(10),
        ),
        CustomOutlineButton(
          icon: Icons.add,
          onPress: () {
            context.read(cartItemCountRef(id).notifier).increment();
          },
        ),
      ],
    );
  }
}
