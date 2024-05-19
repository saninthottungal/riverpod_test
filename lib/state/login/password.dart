import 'package:flutter_riverpod/flutter_riverpod.dart';

final passWordProvider =
    NotifierProvider.autoDispose<PasswordState, bool>(PasswordState.new);

class PasswordState extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  changeState() {
    state = !state;
  }
}
