import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';

import '../model/helper.dart';

class Calls extends StatefulWidget {
  const Calls({
    Key? key,
  }) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: backgroundColor,
      height: size.height - 60,
      width: size.width,
      child: ListView.builder(
          primary: false,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          itemCount: userlist.length,
          itemBuilder: (BuildContext context, int index) {
            var i = userlist;
            return InkWell(
              onTap: () {
                // Routs().route(
                //     context: context,
                //     route: View_message(helper: i[index]));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Hero(
                          transitionOnUserGestures: true,
                          tag: i[index].userimage,
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: messageColor,
                            // backgroundImage:
                            //     NetworkImage(i[index].userimage),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              i[index].username,
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                i[index].isSendmessage
                                    ? Icon(Icons.call_received,
                                        size: 17,
                                        color: i[index].unreadmessage
                                            ? Colors.green
                                            : Colors.red)
                                    : const Icon(
                                        Icons.call_made,
                                        size: 17,
                                        color: Colors.green,
                                      ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  i[index].time,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        i[index].unreadmessage
                            ? const Icon(Icons.call)
                            : const Icon(Icons.videocam)
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
