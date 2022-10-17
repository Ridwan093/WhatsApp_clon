import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/common/enum/enums.dart';

class Messages {
  final String senderID;
  final String reciverID;
  final String text;
  final MessageEnum type;
  final String messageId;
  final bool isSeen;
  final DateTime timeSend;

  Messages(
      {required this.senderID,
      required this.reciverID,
      required this.text,
      required this.type,
      required this.messageId,
      required this.isSeen,
      required this.timeSend});

  Map<String, dynamic> toMap() {
    return {
      "senderID": senderID,
      "reciverID": reciverID,
      "text": text,
      "type": type,
      "messageId": messageId,
      "isSeen": isSeen,
      "tineSend": timeSend.millisecondsSinceEpoch
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
        senderID: map['senderID'] ?? '',
        reciverID: map['reciverID'] ?? '',
        text: map['text'] ?? '',
        type: (map['type'] as String).toEnum(),
        messageId: map['messageId'] ?? '',
        isSeen: map['isSeen'] ?? false,
        timeSend: DateTime.fromMillisecondsSinceEpoch(map['timeSend']));
  }
}
