import 'package:get_it/get_it.dart';
import 'package:zoom_clone/repository/user_repository.dart';
import 'package:zoom_clone/services/firebase_auth_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
}
