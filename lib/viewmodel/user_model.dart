import 'package:flutter/material.dart';
import 'package:zoom_clone/locator.dart';
import 'package:zoom_clone/repository/user_repository.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  Uzer? _uzer;

  Uzer? get uzer => _uzer;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<Uzer?> currentUser() async {
    try {
      state = ViewState.Busy;
      _uzer = await _userRepository.currentUser();
      return _uzer;
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Uzer?> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _uzer = await _userRepository.signInWithGoogle();
      if (_uzer != null)
        return _uzer;
      else
        return null;
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool?> signOut() async {
    try {
      state = ViewState.Busy;
      return await _userRepository.signOut();
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
