import 'package:flutter/material.dart';
import 'package:shopping_app_ui/core/models/cart_model/cart_model.dart';
import 'package:shopping_app_ui/core/widgets/custom_back_button/views/custom_back_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
    );
  }
}
