import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/screens/profile_edit.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/viewmodel/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context);
    print("Profil sayfasındaki user değerleri:" + _userModel.uzer.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profiliniz",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: buttonColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: _userModel.uzer!.profilePhoto!,
                    height: 130,
                    width: 130,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Icon(
                    Icons.mail_outline,
                    color: buttonColor,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text(
                    _userModel.uzer!.eMail,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Text(
                      "Mail Adresiniz",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileEdit(),
                )),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 22,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Text(
                          _userModel.uzer!.status!,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        subtitle: Text(
                          "Durumunuz",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        leading: Icon(
                          Icons.web,
                          size: 34,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      title: Text(
                        "Hakkında",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      leading: Icon(
                        Icons.info_outline_rounded,
                        size: 34,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            InkWell(
              onTap: () => _authMethods.signOut(context),
              child: Text(
                "Hesabımı Sil",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            InkWell(
              onTap: () {
                _authMethods.signOut(context);
              },
              child: Text(
                "Çıkış Yap",
                style: TextStyle(color: buttonColor, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
