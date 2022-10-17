class Helper {
  String userimage;
  String username;
  String usernumber;
  String usermessages;
  String time;
  String uid;
  bool unreadmessage;
  bool isSendmessage;

  Helper(
      {required this.userimage,
      required this.uid,
      required this.username,
      required this.usermessages,
      required this.usernumber,
      required this.time,
      required this.unreadmessage,
      required this.isSendmessage});
}

List<Helper> userlist = [
  Helper(
      userimage:
          'https://media.istockphoto.com/photos/close-up-young-smiling-man-in-casual-clothes-posing-isolated-on-blue-picture-id1270987867?k=20&m=1270987867&s=612x612&w=0&h=lX9Y1qUxtWOa0W0Mc-SvNta00UH0-sgJQItkxfwE4uU=',
      username: 'justin biber',
      usermessages: 'Good morning Happy week...',
      usernumber: '+2348120276047',
      time: 'Yesterday',
      unreadmessage: false,
      isSendmessage: false,
      uid: ''),
  Helper(
      uid: '',
      userimage:
          'https://media.istockphoto.com/photos/young-woman-with-dark-hair-winks-and-wide-open-her-mouth-shooting-on-picture-id1041748522?k=20&m=1041748522&s=612x612&w=0&h=qF7TEUMf5U1iXX5ooYl6FAWKt47xbFW5dQXZQJh4tvg=',
      username: 'Nike Maike',
      usermessages: 'ok i Know...',
      usernumber: '+2348120276047',
      time: '1:45 Pm',
      unreadmessage: false,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWLklwu320Y6aLmLM2oPTGchZEyIEzLTXIth5lZk8bzUmuVG7R4pRZy_UlwdGePZJpVhg&usqp=CAU',
      username: 'Kalihd',
      usermessages: " they did't belive in ours..",
      usernumber: '+2348120276047',
      time: '7:00 Am',
      unreadmessage: true,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRySmBdCd5lJU96xxl5-t5YJKQQItbxRq46Bw&usqp=CAU',
      username: 'Tatiana Mogan',
      usermessages: 'got to get up...',
      usernumber: '+2348120276047',
      time: '4:30 Pm',
      unreadmessage: false,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeDFTbBebo_4WrmfQyPr07Wz2lpweYyWcOJw&usqp=CAU',
      username: 'Olamide opps',
      usermessages: 'coming for you bro...',
      usernumber: '+2348120276047',
      time: '4:30 Pm',
      unreadmessage: true,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGzdOLiUY49PYehX3bBPkpGwvPgki_2kQvYw&usqp=CAU',
      username: 'Kevin Debruney',
      usermessages: 'how are you doing',
      usernumber: '+2348120276047',
      time: '4:30 Pm',
      unreadmessage: false,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJTqi40dQIZaMF9IMr3pQHyZF-bxgc0z7Rw&usqp=CAU',
      username: 'j........k',
      usermessages: 'got to get up...',
      usernumber: '+2348120276047',
      time: '4:30 Pm',
      unreadmessage: false,
      isSendmessage: true),
  Helper(
      uid: '',
      userimage:
          'https://media.gettyimages.com/photos/smiling-man-in-the-living-room-is-taking-a-selfie-picture-id813935198?k=20&m=813935198&s=612x612&w=0&h=6gNade8eFqii-8fmy4CTb3yl21qeLyxLHGe5TBnQBmI=',
      username: 'Loser',
      usermessages: 'Hi',
      usernumber: '+2348120276047',
      time: '4:30 Pm',
      unreadmessage: true,
      isSendmessage: true),
];
