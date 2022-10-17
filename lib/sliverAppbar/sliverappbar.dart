import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';

class Sliverappbar extends StatefulWidget {
  const Sliverappbar({Key? key}) : super(key: key);

  @override
  State<Sliverappbar> createState() => _SliverappbarState();
}

bool isSelected = false;
bool check = true;
bool expandcontainer = false;
Widget? floatingActionButton;

Widget? popupMenuButton;

int drag = 0;

class _SliverappbarState extends State<Sliverappbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appBarColor,
      pinned: true,
      snap: true,
      floating: true,
      bottom: TabBar(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        dragStartBehavior: DragStartBehavior.start,
        labelColor: tabColor,
        unselectedLabelColor: textColor,
        indicatorColor: tabColor,
        automaticIndicatorColorAdjustment: true,
        onTap: (i) {
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
                onPressed: () {},
                child: const Icon(
                  Icons.message,
                  color: textColor,
                ),
              );
              //popumenubutton logic --> Chats
              popupMenuButton = PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 1, child: Text('Business tools')),
                  const PopupMenuItem(value: 2, child: Text('New group')),
                  const PopupMenuItem(value: 3, child: Text('New brocadcast')),
                  const PopupMenuItem(value: 4, child: Text('Labels')),
                  const PopupMenuItem(value: 5, child: Text('Linked devices')),
                  const PopupMenuItem(
                      value: 5, child: Text('Starred messages')),
                  const PopupMenuItem(value: 5, child: Text('Settings')),
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
              popupMenuButton = PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 1, child: Text('Status privacy')),
                  const PopupMenuItem(value: 2, child: Text('Business tools')),
                  const PopupMenuItem(value: 4, child: Text('Settings')),
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
            popupMenuButton = PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(value: 1, child: Text('Clear call log')),
                const PopupMenuItem(value: 2, child: Text('Business tools')),
                const PopupMenuItem(value: 4, child: Text('Settings')),
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
                      color: isSelected ? tabColor : textColor, fontSize: 16),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: isSelected ? tabColor : textColor,
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
      flexibleSpace: expandcontainer
          ? FlexibleSpaceBar(
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
                          style: TextStyle(color: textColor, fontSize: 23),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon:
                                    const Icon(Icons.search, color: textColor)),
                            Container(child: popupMenuButton),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : FlexibleSpaceBar(
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
                          style: TextStyle(color: textColor, fontSize: 23),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon:
                                    const Icon(Icons.search, color: textColor)),
                            Container(child: popupMenuButton),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
