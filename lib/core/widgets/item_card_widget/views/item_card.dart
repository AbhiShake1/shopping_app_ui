import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../models/cart_model/cart_model.dart';
import '../../main_loading_widget/views/main_loading.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.product, required this.onPress})
      : super(key: key);

  final CartModel product;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(int.parse(product.colorHex, radix: 16)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: '${product.id}',
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  progressIndicatorBuilder: (_, __, ___) => const MainLoading(),
                  errorWidget: (_, __, ___) =>
                      Lottie.asset('assets/json/lottie/error.json'),
                ),
              ),
            ),
          ),
          product.title.text.make().pSymmetric(v: 5),
          '\$${product.price}'.text.bold.make(),
        ],
      ),
    );
  }
}
