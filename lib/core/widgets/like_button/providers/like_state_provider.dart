import 'package:hooks_riverpod/hooks_riverpod.dart';

class _LikeStateProvider extends StateNotifier<bool> {
  _LikeStateProvider() : super(false);

  bool get isLiked => state;

  void flip() => state = !state;
}

//create states if non existing ids are passed
final likeStateRef =
    StateNotifierProvider.family<_LikeStateProvider, bool, int>((_, __) {
  return _LikeStateProvider();
});
