import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ContextX on BuildContext {
  Result read<Result>(ProviderBase<Result> provider) {
    return ProviderScope.containerOf(this).read(provider);
  }
}
