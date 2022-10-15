import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/locator.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';
import 'package:zoom_clone/services/auth_base.dart';
import 'package:zoom_clone/services/firebase_auth_service.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Uzer? _uzer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home: ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
