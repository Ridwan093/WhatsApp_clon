import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';

import '../repositry/cart_repositry.dart';

final chatControllerProvider = Provider((ref) {
  final cartRepositry = ref.watch(chatRepositryprovider);
  return ChatController(cartRepositry, ref);
});

class ChatController {
  final CartRepositry cartRepositry;
  final ProviderRef ref;

  ChatController(this.cartRepositry, this.ref);
  void sendTextMessage(
      {required BuildContext context,
      required String text,
      required String reciverUserId}) {
    ref.read(userDataAuthprovider).whenData((value) =>
        cartRepositry.sendTextMessage(
            context: context,
            senderUser: value!,
            reciverUserId: reciverUserId,
            text: text));
  }
}
