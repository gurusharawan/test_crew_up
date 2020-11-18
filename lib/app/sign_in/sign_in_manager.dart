import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:test_crew_up/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<AuthUser> _signIn(Future<AuthUser> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<AuthUser> signInAnonymously() async => await _signIn(auth.signInAnonymously);

  Future<AuthUser> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<AuthUser> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);
}
