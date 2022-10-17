import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';

import 'package:whatsapp_clone/model/helper.dart';
import 'package:whatsapp_clone/model/user_model.dart';

import '../../bobble_folder/bobble.dart';
import '../../colors/colors.dart';
import '../widget/bottom_cart.dart';

// ignore: camel_case_types
class View_message extends ConsumerWidget {
  final String userName;
  final String uid;

  View_message({Key? key, required this.userName, required this.uid})
      : super(key: key);

  AnimationController? _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     value: 0.0,
  //     duration: Duration(seconds: 25),
  //     upperBound: 1,
  //     lowerBound: -1,
  //     vsync: this,
  //   )..repeat();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller!.dispose();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backgroundColor,
          leadingWidth: 20.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Row(
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: userName,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: messageColor,
                  // backgroundImage: NetworkImage(helper.userimage),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              StreamBuilder<UserModel>(
                  stream:
                      ref.read(authControlerProvider).userDatabyId(userId: uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        Text(
                          userName,
                          style:
                              const TextStyle(color: textColor, fontSize: 17),
                        ),
                        Text(
                          snapshot.data!.isOnline ? 'online' : 'offline',
                          style: const TextStyle(
                              color: textColor,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    );
                    ;
                  }),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.videocam, color: textColor)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.call, color: textColor)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: textColor)),
              ],
            )
          ]),
      bottomSheet: Bottomset(
        reciverUserId: uid,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://github.com/RivaanRanawat/whatsapp-flutter-ui/blob/main/assets/backgroundImage.png?raw=true'),
                fit: BoxFit.cover)),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Bobbles(
                  bubbleEdges: BubbleEdges.only(top: 20, left: 100),
                  borderwidth: 100,
                  elevation: 10,
                  alignment: Alignment.topRight,
                  nip: BubbleNip.rightTop,
                  color: messageColor,
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam luctus justo euismod, pharetra nisl eget, ullamcorper orci Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam luctus justo euismod, pharetra nisl eget, ullamcorper orci',
                  time: '20:09',
                  image: '',
                  imageheight: 200.0,
                  imagewidth: double.infinity,
                  isuser: true,
                  isveiwcolor: false,
                  isveiws: false,
                  showimage: true,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Bobbles(
                  bubbleEdges: BubbleEdges.only(top: 20, right: 100),
                  borderwidth: 100,
                  elevation: 10,
                  alignment: Alignment.topRight,
                  nip: BubbleNip.leftTop,
                  color: appBarColor,
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam luctus justo euismod, pharetra nisl eget, ullamcorper orci',
                  time: '93030',
                  image: '',
                  imageheight: 200.0,
                  imagewidth: double.infinity,
                  isuser: false,
                  isveiwcolor: false,
                  isveiws: false,
                  showimage: false,
                ),
                Bobbles(
                  bubbleEdges: BubbleEdges.only(top: 5, right: 100),
                  borderwidth: 100,
                  elevation: 10,
                  alignment: Alignment.topRight,
                  nip: BubbleNip.no,
                  color: appBarColor,
                  message: 'Lorem ipsum dolor sit amet, consectetur ',
                  time: 'Now',
                  image: '',
                  imageheight: 200.0,
                  imagewidth: double.infinity,
                  isuser: false,
                  isveiwcolor: false,
                  isveiws: false,
                  showimage: false,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Bobbles(
                  bubbleEdges: BubbleEdges.only(top: 20, left: 100),
                  borderwidth: 100,
                  elevation: 10,
                  alignment: Alignment.topRight,
                  nip: BubbleNip.rightTop,
                  color: messageColor,
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '12:20 Am',
                  image: '',
                  imageheight: 200.0,
                  imagewidth: double.infinity,
                  isuser: true,
                  isveiwcolor: true,
                  isveiws: true,
                  showimage: false,
                ),
                Bobbles(
                  bubbleEdges: BubbleEdges.only(top: 5, left: 140),
                  borderwidth: 0.0,
                  elevation: 10,
                  alignment: Alignment.topRight,
                  nip: BubbleNip.no,
                  color: Color.fromARGB(255, 37, 211, 102),
                  message: 'Lorem ipsum dolor ',
                  time: '12:20 Am',
                  image: '',
                  imageheight: 200.0,
                  imagewidth: double.infinity,
                  isuser: true,
                  isveiwcolor: false,
                  isveiws: true,
                  showimage: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class DrawClip extends CustomClipper<Path> {
//   double move = 0;
//   double slice = math.pi;
//   DrawClip(this.move);
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.8);
//     double xCenter =
//         size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);

//     double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
//     path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
