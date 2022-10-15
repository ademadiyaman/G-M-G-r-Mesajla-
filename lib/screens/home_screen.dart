import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/locator.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/screens/profile_screen.dart';
import 'package:zoom_clone/services/auth_base.dart';
import 'package:zoom_clone/services/firebase_auth_service.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  final Uzer? uzer;
  AuthBase authService = locator<FirebaseAuthService>();
  HomeScreen({Key? key, this.uzer}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    List<Widget> pages = [
      MeetingScreen(
        uzer: _userModel.uzer,
      ),
      const HistoryMeetingScreen(),
      const ProfilePage(),
    ];
    /*
    widget.authService!.currentUser().then((user) {
      widget.uzer = user;
    });*/
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: buttonColor,
        unselectedItemColor: Colors.white,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Yeni Görüşme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_phone_outlined),
            label: 'Görüşmeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
