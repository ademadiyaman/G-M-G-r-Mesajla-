import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/meeting_option.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/jitsi_meet_method.dart';
import 'package:zoom_clone/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethod.createNewMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        userName: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Buluşmaya katıl!',
          style: TextStyle(fontSize: 18, color: buttonColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Oda Numarası Giriniz:",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroungColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Oda Numarası',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Kullanıcı Adınız:",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroungColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'İsim',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Bağlan',
                style: TextStyle(
                    fontSize: 17,
                    color: buttonColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
              text: 'Don\'t join a meeting',
              isMute: isAudioMuted,
              onChange: onAudioMuted),
          MeetingOption(
              text: 'Turn off My Video',
              isMute: isVideoMuted,
              onChange: onVideoMuted),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
