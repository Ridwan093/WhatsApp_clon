import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors/colors.dart';
import 'package:whatsapp_clone/common/Error_page.dart';
import 'package:whatsapp_clone/common/loding_page.dart';
import 'package:whatsapp_clone/select_contact/controller/select_contact_controller.dart';
import 'package:whatsapp_clone/common/loding_page.dart';

class SelectContanctScreen extends ConsumerWidget {
  const SelectContanctScreen({Key? key}) : super(key: key);
  void selectContact(
      {required Contact selectcontact,
      required BuildContext context,
      required WidgetRef ref}) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectcontact: selectcontact, context: context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        title: const Text('Select Contact'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: textColor)),
              const SizedBox(
                  height: 50, width: 50, child: Icon(Icons.more_vert)),
            ],
          )
        ],
      ),
      body: ref.watch(getContactProvider).when(
          data: (listofcontanct) => ListView.builder(
              itemCount: listofcontanct.length,
              itemBuilder: (context, index) {
                var contact = listofcontanct[index];
                return ListTile(
                  onTap: () => selectContact(
                      selectcontact: contact, context: context, ref: ref),
                  leading: contact.photo == null
                      ? null
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage: MemoryImage(contact.photo!),
                        ),
                  title: Text(contact.displayName),
                );
              }),
          error: (error, we) {
            return Error(error: error.toString());
          },
          loading: () {
            return const Lodind();
          }),
    );
  }
}
