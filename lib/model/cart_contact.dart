class ChatContact {
  final String name;
  final String profilepice;
  final String contactId;
  final DateTime sendeTime;
  final String lastMessage;

  ChatContact(
      {required this.name,
      required this.profilepice,
      required this.contactId,
      required this.sendeTime,
      required this.lastMessage});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "profilepice": profilepice,
      "contactId": contactId,
      "sendeTime": sendeTime,
      "lastMessage": lastMessage,
    };
  }

  factory ChatContact.fromMap(Map<String, dynamic> map) {
    return ChatContact(
        name: map["name"] ?? "",
        profilepice: map["profilepice"] ?? "",
        contactId: map["contactId"] ?? "",
        sendeTime: DateTime.fromMillisecondsSinceEpoch(map['sendeTime']),
        lastMessage: map["lastMessage"] ?? "");
  }
}
