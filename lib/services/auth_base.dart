import 'package:firebase_auth/firebase_auth.dart';

import '../resources/user.dart';

abstract class AuthBase {
  Future<Uzer?> currentUser();
  Future<Uzer?> signInWithGoogle();
  Future<bool?> signOut();
}
