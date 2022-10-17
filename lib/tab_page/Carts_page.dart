import 'package:flutter/material.dart';
import 'package:whatsapp_clone/cart/screen/view_message.dart';

import 'package:whatsapp_clone/colors/colors.dart';
import 'package:whatsapp_clone/model/helper.dart';

import '../route/route_helper.dart';

class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
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
                Routs().route(
                    context: context,
                    route: View_message(
                      userName: 'jams',
                      uid: '',
                    ));
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
                          child: CircleAvatar(
                            radius: 30,
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
                                // issend
                                i[index].isSendmessage
                                    ? Icon(Icons.done_all,
                                        size: 17,
                                        color: i[index].unreadmessage
                                            ? Colors.grey.shade500
                                            : Colors.blue)
                                    : Icon(
                                        Icons.done,
                                        size: 17,
                                        color: Colors.grey.shade500,
                                      ),
                                const SizedBox(
                                  width: 2,
                                ),

                                Text(
                                  i[index].usermessages,
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
                        Text(
                          i[index].time,
                          style: TextStyle(
                              color: i[index].unreadmessage
                                  ? tabColor
                                  : Colors.grey.shade500,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        i[index].unreadmessage
                            ? const CircleAvatar(
                                radius: 9,
                                backgroundColor: tabColor,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: textColor, fontSize: 10),
                                  ),
                                ),
                              )
                            : const SizedBox()
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
