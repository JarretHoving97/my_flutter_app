import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // ignore: body_might_complete_normally_nullable
  Future<Void?> singout() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Singed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> singUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Singed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
