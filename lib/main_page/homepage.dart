import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/route/route_helper.dart';
import 'package:whatsapp_clone/tab_page/Carts_page.dart';
import 'package:whatsapp_clone/tab_page/calls.dart';

import '../colors/colors.dart';
import '../select_contact/screen/select_contact_screen.dart';
import '../tab_page/status.dart';

class Hompage extends StatefulWidget {
  const Hompage({Key? key}) : super(key: key);

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  bool isSelected = false;
  bool check = true;
  bool expandcontainer = false;
  Widget? floatingActionButton;

  Widget? popupMenuButton;
  double expandedsize = 0.0;
  int drag = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          floatingActionButton: check
              ? FloatingActionButton(
                  backgroundColor: tabColor,
                  onPressed: () {
                    Routs().route(
                        context: context, route: const SelectContanctScreen());
                  },
                  child: const Icon(
                    Icons.message,
                    color: textColor,
                  ),
                )
              : floatingActionButton,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  leadingWidth: expandedsize,
                  backgroundColor: appBarColor,
                  pinned: true,
                  snap: true,
                  floating: true,
                  bottom: TabBar(
                    physics: const ScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    dragStartBehavior: DragStartBehavior.start,
                    labelColor: tabColor,
                    unselectedLabelColor: textColor,
                    indicatorColor: tabColor,
                    automaticIndicatorColorAdjustment: true,
                    onTap: (i) {
                      switch (i) {
                        case 1:
                          popupMenuButton = PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  value: 1, child: Text('Business tools')),
                              const PopupMenuItem(
                                  value: 2, child: Text('New group')),
                              const PopupMenuItem(
                                  value: 3, child: Text('New brocadcast')),
                              const PopupMenuItem(
                                  value: 4, child: Text('Labels')),
                              const PopupMenuItem(
                                  value: 5, child: Text('Linked devices')),
                              const PopupMenuItem(
                                  value: 5, child: Text('Starred messages')),
                              const PopupMenuItem(
                                  value: 5, child: Text('Settings')),
                            ],
                            color: appBarColor,
                            elevation: 10.0,
                            onSelected: (value) {
                              if (value == 1) {
                              } else if (value == 2) {
                              } else if (value == 3) {}
                            },
                          );

                          break;
                        case 2:
                          popupMenuButton = PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  value: 1, child: Text('Status privacy')),
                              const PopupMenuItem(
                                  value: 2, child: Text('Business tools')),
                              const PopupMenuItem(
                                  value: 4, child: Text('Settings')),
                            ],
                            color: appBarColor,
                            elevation: 10.0,
                            onSelected: (value) {
                              if (value == 1) {
                              } else if (value == 2) {
                              } else if (value == 3) {}
                            },
                          );
                          break;
                        case 3:
                          popupMenuButton = PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  value: 1, child: Text('Clear call log')),
                              const PopupMenuItem(
                                  value: 2, child: Text('Business tools')),
                              const PopupMenuItem(
                                  value: 4, child: Text('Settings')),
                            ],
                            color: appBarColor,
                            elevation: 10.0,
                            onSelected: (value) {
                              if (value == 1) {
                              } else if (value == 2) {
                              } else if (value == 3) {}
                            },
                          );
                          break;
                        default:
                          setState(() {
                            popupMenuButton = PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                    value: 1, child: Text('Business tools')),
                                const PopupMenuItem(
                                    value: 2, child: Text('New group')),
                                const PopupMenuItem(
                                    value: 3, child: Text('New brocadcast')),
                                const PopupMenuItem(
                                    value: 4, child: Text('Labels')),
                                const PopupMenuItem(
                                    value: 5, child: Text('Linked devices')),
                                const PopupMenuItem(
                                    value: 5, child: Text('Starred messages')),
                                const PopupMenuItem(
                                    value: 5, child: Text('Settings')),
                              ],
                              color: appBarColor,
                              elevation: 10.0,
                              onSelected: (value) {
                                if (value == 1) {
                                } else if (value == 2) {
                                } else if (value == 3) {}
                              },
                            );
                          });
                      }
                      if (i == 0) {
                        setState(() {
                          isSelected = false;
                        });
                      } else if (i == 1) {
                        setState(() {
                          i = drag;
                          isSelected = true;
                          check = false;
                          floatingActionButton = FloatingActionButton(
                            backgroundColor: tabColor,
                            onPressed: () {
                              Routs().route(
                                  context: context,
                                  route: const SelectContanctScreen());
                            },
                            child: const Icon(
                              Icons.message,
                              color: textColor,
                            ),
                          );
                          //popumenubutton logic --> Chats
                        });
                      } else if (i == 2) {
                        setState(() {
                          isSelected = false;
                          floatingActionButton = Wrap(
                            direction: Axis.vertical,
                            children: [
                              SizedBox(
                                height: 50,
                                child: FloatingActionButton(
                                  backgroundColor: appBarColor,
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.create,
                                    color: textColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              FloatingActionButton(
                                backgroundColor: tabColor,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: textColor,
                                ),
                              ),
                            ],
                          );
                          //popumenubutton logic --> Satus
                        });
                      } else if (i == 3) {
                        setState(() {
                          isSelected = false;
                          floatingActionButton = FloatingActionButton(
                            backgroundColor: tabColor,
                            onPressed: () {},
                            child: const Icon(
                              Icons.add_call,
                              color: textColor,
                            ),
                          );
                        });
                        //popumenubutton logic --> Calls

                      } else {
                        popupMenuButton = PopupMenuButton(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                                value: 1, child: Text('Business tools')),
                            const PopupMenuItem(
                                value: 2, child: Text('New group')),
                            const PopupMenuItem(
                                value: 3, child: Text('New brocadcast')),
                            const PopupMenuItem(
                                value: 4, child: Text('Labels')),
                            const PopupMenuItem(
                                value: 5, child: Text('Linked devices')),
                            const PopupMenuItem(
                                value: 5, child: Text('Starred messages')),
                            const PopupMenuItem(
                                value: 5, child: Text('Settings')),
                          ],
                          color: appBarColor,
                          elevation: 10.0,
                          onSelected: (value) {
                            if (value == 1) {
                            } else if (value == 2) {
                            } else if (value == 3) {}
                          },
                        );
                      }
                    },
                    tabs: <Widget>[
                      Tab(
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt),
                        ),
                      ),
                      Tab(
                        icon: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'CHATS',
                              style: TextStyle(
                                  color: isSelected ? tabColor : textColor,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor:
                                    isSelected ? tabColor : textColor,
                                radius: 10,
                                child: const Center(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Tab(
                        text: 'STATUS',
                      ),
                      const Tab(
                        text: 'CALLS',
                      ),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: SafeArea(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
                                'WhatsApp Business',
                                style:
                                    TextStyle(color: textColor, fontSize: 23),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.search,
                                          color: textColor)),
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: popupMenuButton),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SizedBox(
                      // or SizedBox, etc.
                      height: MediaQuery.of(context).size.height - 60,
                      child: TabBarView(children: [
                        SafeArea(
                            child: Image.network(
                                'https://raw.githubusercontent.com/RivaanRanawat/flutter-whatsapp-clone/master/assets/bg.png')),
                        const Carts(),
                        const Ststus(),
                        const Calls(),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
