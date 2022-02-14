part of 'product_details_screen.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          height: 50,
          width: 58,
          child: AddToCartAnimation(id: product.id),
        ).p8(),
        Expanded(
          child: SizedBox(
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color: Color(int.parse(product.colorHex, radix: 16)),
              child: 'BUY NOW'.text.bold.size(17).make(),
              onPressed: () {},
            ),
          ),
        ),
      ],
    ).py20();
  }
}
