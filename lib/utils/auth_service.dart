import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'loading_screen.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email & Password Sign Up
  Future<User?> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print('Email Sign-Up Error: $e');
      return null;
    }
  }

  // Email & Password Sign In
  Future<User?> signInWithEmail(String email, String password,BuildContext context,) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong!";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password.";
      } else if (e.code == 'invalid-credential') {
        message = "Invalid email or password.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      return null;
    }
  }

  // Google Sign In
  Future<User?> signInWithGoogle() async {
    loadingScreen.show();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      loadingScreen.hide();
      return result.user;
    } catch (e) {
      loadingScreen.hide();
      print('Google Sign-In Error: $e');
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
