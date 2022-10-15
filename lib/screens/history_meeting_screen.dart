import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/aurh_mothods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/utils/colors.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthMethods _authMethods = AuthMethods();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Görüşmeleriniz",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: buttonColor,
      ),
      body: StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                _authMethods.user.displayName!,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Oda Adı: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                style: TextStyle(color: Colors.black),
              ),
              trailing: Text(
                '${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}
