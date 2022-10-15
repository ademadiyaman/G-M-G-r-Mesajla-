import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/locator.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/services/auth_base.dart';
import 'package:zoom_clone/services/firebase_auth_service.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  final Function(Uzer)? onSignIn;
  AuthBase authService = locator<FirebaseAuthService>();
  LoginScreen({Key? key, this.onSignIn}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Görüşme başlat veya Görüşmeye Katıl',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          SizedBox(
            height: 31,
          ),
          CustomButton(
            text: 'Google ile Giriş',
            onPressed: () => _googleIleGiris(context),
          ),
        ],
      ),
    );
  }

  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Uzer? _user = await _userModel.signInWithGoogle();
    if (_user != null) print("Oturum Açan User Id:" + _user.uid.toString());
  }
}
