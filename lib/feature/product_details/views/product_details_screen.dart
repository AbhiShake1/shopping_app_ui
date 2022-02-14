import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app_ui/core/models/cart_model/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopping_app_ui/core/widgets/custom_widgets.dart';
import 'package:shopping_app_ui/riverpod_extensions.dart';

import '../../../core/widgets/add_to_cart_animation/providers/cart_item_count_provider.dart';

part 'product_details_body.dart';

part 'cart_counter.dart';

part 'add_to_cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: const [
          ThemeSwitcher(),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ProductDetailsBody(product: product),
    );
  }
}
