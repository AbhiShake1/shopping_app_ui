import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_app_ui/feature/home/providers/page_controller_provider.dart';

class _CategoryIndexProvider extends StateNotifier<int> {
  _CategoryIndexProvider({required this.ref}) : super(0);

  final StateNotifierProviderRef ref;

  set categoryIndex(int newIndex) {
    state = newIndex;
    ref.read(pageControllerRef).jumpToPage(state);
  }
}

final categoryIndexRef = StateNotifierProvider<_CategoryIndexProvider, int>(
    (ref) => _CategoryIndexProvider(ref: ref));
