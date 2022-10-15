import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/jitsi_meet_method.dart';
import 'package:zoom_clone/resources/user.dart';
import 'package:zoom_clone/services/auth_base.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  late final AuthBase? authService;
  late final Uzer? uzer;
  MeetingScreen({Key? key, this.authService, this.uzer}) : super(key: key);

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethod.createNewMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = UserModel();
    final AuthMethods _authMethods = AuthMethods();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Görüş & Mesajlaş",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: buttonColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: 'Yeni Görüşme',
              ),
              HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                text: 'Görüşmeye Katıl',
                icon: Icons.add_box_rounded,
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videocam,
                      size: 77,
                      color: buttonColor,
                    ),
                    Icon(
                      Icons.message,
                      size: 60,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Yukarıdaki seçeneklerden Yeni Görüşme başlatabilir veya bir Görüşmeye Katılabilirsiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
