part of 'product_details_screen.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: context.screenHeight * 0.3),
                  padding: EdgeInsets.only(
                    top: context.screenHeight * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColoredSizeDots(size: product.size),
                      const SizedBox(height: 20),
                      product.description.text
                          .lineHeight(1.5)
                          .make()
                          .pSymmetric(v: 20),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(id: product.id),
                          LikeButton(id: product.id),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    product.title.text.headline4(context).bold.makeCentered(),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              'Price\n'.textSpan.make(),
                              '\$${product.price}'
                                  .textSpan
                                  .headline4(context)
                                  .bold
                                  .make(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Hero(
                            tag: "${product.id}",
                            child: CachedNetworkImage(
                                imageUrl: product.imageUrl,
                                fit: BoxFit.fill,
                                progressIndicatorBuilder: (_, __, ___) =>
                                    const MainLoading(),
                                errorWidget: (_, __, ___) =>
                                    Lottie.asset('assets/json/lottie/error.json')),
                          ),
                        )
                      ],
                    )
                  ],
                ).px(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
