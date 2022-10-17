import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';

class Bobbles extends StatelessWidget {
  final BubbleEdges bubbleEdges;
  final double borderwidth;
  final double elevation;
  final Alignment alignment;
  final BubbleNip nip;
  final Color color;
  final String message;
  final String time;
  final bool isuser;
  final bool isveiws;
  final bool isveiwcolor;
  final String image;

  final double imageheight;
  final double imagewidth;
  final bool showimage;

  const Bobbles(
      {Key? key,
      required this.bubbleEdges,
      required this.borderwidth,
      required this.elevation,
      required this.alignment,
      required this.nip,
      required this.color,
      required this.message,
      required this.time,
      required this.isuser,
      required this.isveiws,
      required this.isveiwcolor,
      required this.image,
      required this.showimage,
      required this.imageheight,
      required this.imagewidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bubble(
        margin: bubbleEdges,
        borderWidth: borderwidth,
        elevation: elevation,
        alignment: alignment,
        nip: nip,
        color: color,
        child: Column(
          children: [
            showimage
                ? Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    height: imageheight,
                    width: imagewidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.cover)),
                  )
                : const SizedBox(),
            Text(message),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                isuser
                    ? Icon(
                        isveiws ? Icons.done_all : Icons.done,
                        color: isveiwcolor ? Colors.blue : textColor,
                        size: 19,
                      )
                    : const SizedBox()
              ],
            )
          ],
        ));
  }
}
