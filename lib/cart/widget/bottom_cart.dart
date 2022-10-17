import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/cart/controller/chat_controller.dart';

import '../../colors/colors.dart';

class Bottomset extends ConsumerStatefulWidget {
  final String reciverUserId;
  Bottomset({Key? key, required this.reciverUserId}) : super(key: key);

  @override
  ConsumerState<Bottomset> createState() => _BottomsetState();
}

class _BottomsetState extends ConsumerState<Bottomset> {
  final TextEditingController _message = TextEditingController();

  bool isShow = false;
  void sendTextMessage() {
    if (isShow) {
      ref.read(chatControllerProvider).sendTextMessage(
          context: context,
          text: _message.text.trim(),
          reciverUserId: widget.reciverUserId);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _message.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            onChanged: ((value) {
              if (value.isNotEmpty) {
                setState(() {
                  isShow = true;
                });
              } else {
                setState(() {
                  isShow = false;
                });
              }
            }),
            decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Message',
                hintText: 'typing a....',
                hintStyle: const TextStyle(color: textColor),
                filled: true,
                fillColor: backgroundColor,
                prefixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.emoji_emotions)),
                      IconButton(
                          onPressed: (() {}), icon: const Icon(Icons.gif)),
                    ],
                  ),
                ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: (() {}), icon: const Icon(Icons.link)),
                      IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.camera_alt))
                    ],
                  ),
                )),
          )),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: CircleAvatar(
                radius: 25,
                backgroundColor: messageColor,
                child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: isShow
                            ? const Icon(
                                Icons.send,
                                color: textColor,
                                size: 24,
                              )
                            : const Icon(
                                Icons.mic,
                                color: textColor,
                                size: 24,
                              )))),
          ),
        ],
      ),
    );
  }
}
