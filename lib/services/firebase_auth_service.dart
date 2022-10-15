import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Uzer?> currentUser() async {
    try {
      User user = await _firebaseAuth.currentUser!;
      return _userFromFirebase(user);
    } catch (e) {
      print("Hata current user:" + e.toString());
    }
  }

  Uzer? _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return Uzer(uid: user.uid, eMail: user.email!);
    }
  }

  @override
  Future<Uzer?> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        User? _user = sonuc.user;
        return _userFromFirebase(_user!);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Sign out error:" + e.toString());
      return false;
    }
  }
}
