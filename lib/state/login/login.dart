import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = AsyncNotifierProvider<AuthNotifer, User?>(AuthNotifer.new);

class AuthNotifer extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    state = AsyncData(FirebaseAuth.instance.currentUser);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    state = AsyncData(FirebaseAuth.instance.currentUser);
  }

  Future<void> signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    state = AsyncData(FirebaseAuth.instance.currentUser);
  }
}
