import 'package:flutter/material.dart';
import 'package:zoom_clone/locator.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/services/auth_base.dart';
import 'package:zoom_clone/services/firebase_auth_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  final AuthMethods _authMethods = AuthMethods();

  AppMode appMode = AppMode.RELEASE;
  @override
  Future<Uzer?> currentUser() async {
    if (appMode == AppMode.RELEASE) {
      Uzer? _user = await _firebaseAuthService.currentUser();
      if (_user != null) {
        return await _authMethods.readUser(_user.uid);
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    }
  }

  @override
  Future<Uzer?> signInWithGoogle() async {
    if (appMode == AppMode.RELEASE) {
      Uzer? _user = await _firebaseAuthService.signInWithGoogle();
      if (_user != null) {
        bool? _sonuc = await _authMethods.saveUser(_user);
        if (_sonuc) {
          return await _authMethods.readUser(_user.uid);
        }
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    } else
      return null;
  }

  @override
  Future<bool?> signOut() async {
    if (appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signOut();
    }
  }
}
