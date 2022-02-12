import 'package:hooks_riverpod/hooks_riverpod.dart';

class _CategoryIndexProvider extends StateNotifier<int> {
  _CategoryIndexProvider() : super(0);

  set categoryIndex(int newIndex) => state = newIndex;
}

final categoryIndexRef = StateNotifierProvider<_CategoryIndexProvider, int>(
    (_) => _CategoryIndexProvider());
