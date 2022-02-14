import 'package:hooks_riverpod/hooks_riverpod.dart';

class _GlobalCartItemCountProvider extends StateNotifier<int> {
  _GlobalCartItemCountProvider() : super(0);

  void increment() => state++;
  void decrement() {
    if (state > 0) state--;
  }
}

//other providers can modify this
final globalCartItemCountRef =
    StateNotifierProvider<_GlobalCartItemCountProvider, int>(
        (_) => _GlobalCartItemCountProvider());
