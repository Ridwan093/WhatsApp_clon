import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';
import 'package:whatsapp_clone/model/helper.dart';

class Ststus extends StatelessWidget {
  const Ststus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.only(left: 10, top: 20),
        children: [
          InkWell(
            onTap: () {
              // Routs().route(
              //     context: context,
              //     route: View_message(helper: i[index]));
            },
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          )),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                        // backgroundImage:
                        //     NetworkImage(i[index].userimage),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'My status',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Tap to addd status update',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ],
                ),
                const Positioned(
                  top: 30,
                  left: 32,
                  child: CircleAvatar(
                    backgroundColor: tabColor,
                    radius: 15,
                    child: Icon(
                      Icons.add,
                      color: textColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Recent update',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: MediaQuery.of(context).size.height - 100,
              color: backgroundColor,
              child: ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    var i = userlist[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: tabColor,
                                    width: 3.0)),
                            child: CircleAvatar(
                              radius: 30,
                              // backgroundColor: backgroundColor,
                              backgroundImage: NetworkImage(i.userimage),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                i.username,
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                i.time,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey.shade500),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
