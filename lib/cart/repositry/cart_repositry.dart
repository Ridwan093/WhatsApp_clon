import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/model/message.dart';
import 'package:whatsapp_clone/model/user_model.dart';
import 'package:whatsapp_clone/utils/utils.dart';

import '../../../common/enum/enums.dart';
import '../../../model/cart_contact.dart';

final chatRepositryprovider = Provider(
    (ref) => CartRepositry(FirebaseFirestore.instance, FirebaseAuth.instance));

class CartRepositry {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CartRepositry(this.firestore, this.auth);
  void _sendDataToContactSubcollection({
    required UserModel sendUserData,
    required UserModel reciveuserDate,
    required String text,
    required DateTime timeSend,
    required String reciverUserid,
  }) async {
    var reciverCartContact = ChatContact(
        name: sendUserData.name,
        profilepice: sendUserData.profilpix,
        contactId: sendUserData.uid,
        sendeTime: timeSend,
        lastMessage: text);
    await firestore
        .collection('user')
        .doc(reciverUserid)
        .collection('chart')
        .doc(auth.currentUser!.uid)
        .set(reciverCartContact.toMap());

    var senderCartContact = ChatContact(
        name: reciveuserDate.name,
        profilepice: reciveuserDate.profilpix,
        contactId: reciveuserDate.uid,
        sendeTime: timeSend,
        lastMessage: text);
    await firestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('chart')
        .doc(reciverUserid)
        .set(senderCartContact.toMap());
  }

  void _saveMessageToMessagesubCollection(
      {required String username,
      required String reciveusername,
      required String text,
      required DateTime timeSend,
      required String reciverUserid,
      required MessageEnum messageType,
      required String messageId}) async {
    final message = Messages(
        senderID: auth.currentUser!.uid,
        reciverID: reciverUserid,
        text: text,
        type: messageType,
        messageId: messageId,
        isSeen: false,
        timeSend: timeSend);
    await firestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('chart')
        .doc(reciverUserid)
        .collection('message')
        .doc(messageId)
        .set(message.toMap());
    await firestore
        .collection('user')
        .doc(reciverUserid)
        .collection('chart')
        .doc(auth.currentUser!.uid)
        .collection('message')
        .doc(messageId)
        .set(message.toMap());
  }

  void sendTextMessage(
      {required BuildContext context,
      required UserModel senderUser,
      required String reciverUserId,
      required String text}) async {
    try {
      var timeSend = DateTime.now();

      UserModel reciverUserData;

      var userDataMap =
          await firestore.collection('user').doc(reciverUserId).get();
      reciverUserData = UserModel.fromMap(userDataMap.data()!);
      var messageId = const Uuid().v1();
      _sendDataToContactSubcollection(
          sendUserData: senderUser,
          reciveuserDate: reciverUserData,
          text: text,
          timeSend: timeSend,
          reciverUserid: reciverUserId);

      _saveMessageToMessagesubCollection(
          username: senderUser.name,
          reciveusername: reciverUserData.name,
          text: text,
          timeSend: timeSend,
          reciverUserid: reciverUserId,
          messageType: MessageEnum.texe,
          messageId: messageId);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
