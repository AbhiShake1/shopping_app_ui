import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_app_ui/core/models/cart_model/cart_model.dart';
import 'package:shopping_app_ui/feature/home/providers/category_provider.dart';

final _jsons = [
  'bag_catalog.json',
  'jewelry_catalog.json',
  'footwear_catalog.json',
  'dresses_catalog.json'
];

final cartModelRef = FutureProvider.family<List<CartModel>, int>((ref, index) async {
  final String response =
      await rootBundle.loadString('assets/json/${_jsons[index]}');
  final List jsonData = await jsonDecode(response);
  return List.generate(
    jsonData.length,
    (index) => CartModel.fromJson(jsonData[index]),
  );
});
