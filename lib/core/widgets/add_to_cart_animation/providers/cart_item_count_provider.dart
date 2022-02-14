import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/global_cart_item_count_provider.dart';

class _CartItemCountProvider extends StateNotifier<int> {
  _CartItemCountProvider(this.ref) : super(0);

  final Ref ref;

  void increment() {
    state++;
    ref.read(globalCartItemCountRef.notifier).increment();
  }

  void decrement() {
    if (state > 0) {
      state--;
      ref.read(globalCartItemCountRef.notifier).decrement();
    }
    ;
  }
}

final cartItemCountRef =
    StateNotifierProvider.family<_CartItemCountProvider, int, int>((ref, id) {
  return _CartItemCountProvider(ref);
});
