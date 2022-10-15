import 'package:zoom_clone/resources/user.dart';

abstract class DbBase {
  Future<bool> saveUser(Uzer? user);
  Future<Uzer?> readUser(String? userID);
}
