import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _BrightnessProvider extends StateNotifier<Brightness> {
  _BrightnessProvider() : super(Brightness.light);

  void flip() {
    state = state == Brightness.dark ? Brightness.light : Brightness.dark;
  }
}

final brightnessRef = StateNotifierProvider<_BrightnessProvider, Brightness>(
    (_) => _BrightnessProvider());
