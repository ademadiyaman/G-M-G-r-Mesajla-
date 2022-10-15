import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Uzer {
  final String uid;
  String? userName;
  String eMail;
  String? profilePhoto;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  int? seviye;

  Uzer({required this.uid, required this.eMail});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName':
          userName ?? eMail.substring(0, eMail.indexOf('@')) + randomSayiUret(),
      'eMail': eMail,
      'profilePhoto': profilePhoto ??
          'https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'status': status ?? 'Merhaba ben bu uygulamayı kullanıyorum.',
      'seviye': seviye ?? 1,
    };
  }

  Uzer.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        userName = map['userName'],
        eMail = map['eMail'],
        profilePhoto = map['profilePhoto'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        status = map['status'],
        seviye = map['seviye'];
  Uzer.idveResim({
    required this.uid,
    required this.eMail,
  });
  @override
  String toString() {
    // TODO: implement toString
    return 'Uzer{uid: $uid, userName: $userName, eMail: $eMail, profilePhoto: $profilePhoto, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, seviye: $seviye}';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999999);
    return rastgeleSayi.toString();
  }
}
