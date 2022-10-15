import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController nameController;
  late TextEditingController mailController;
  late TextEditingController meetingIdController;

  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    mailController = TextEditingController(text: _authMethods.user.email);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    mailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Düzenleme",
          style: TextStyle(fontSize: 15, color: buttonColor),
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            "Mail Adresiniz:",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: mailController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroungColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'İsim',
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
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroungColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'İsim',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Durumunuz:",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroungColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'İsim',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Text(
              "Profili Güncelle",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: buttonColor),
            ),
          ),
        ],
      ),
    );
  }
}
