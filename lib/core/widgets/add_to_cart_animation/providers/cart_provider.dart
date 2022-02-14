import 'package:hooks_riverpod/hooks_riverpod.dart';

class _CartProvider extends StateNotifier<bool> {
  _CartProvider() : super(false);

  void flip() => state = !state;
}

final addToCartRef = StateNotifierProvider.family<_CartProvider, bool, int>(
    (_, __) => _CartProvider());
