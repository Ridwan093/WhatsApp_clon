import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String uid;
  final String profilpix;
  final String phonenumber;
  final bool isOnline;
  final List<String> groupid;

  UserModel(
      {required this.name,
      required this.uid,
      required this.profilpix,
      required this.phonenumber,
      required this.isOnline,
      required this.groupid});
  Map<String, dynamic> map() {
    return {
      "name": name,
      "uid": uid,
      "profilpix": profilpix,
      "phonenumber": phonenumber,
      "isOnline": isOnline,
      "groupid": groupid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        uid: map['uid'] ?? '',
        profilpix: map[' profilpix'] ?? '',
        phonenumber: map['phonenumber'] ?? '',
        isOnline: map['isOnline'] ?? false,
        groupid: List<String>.from(map['groupid']));
  }
}
