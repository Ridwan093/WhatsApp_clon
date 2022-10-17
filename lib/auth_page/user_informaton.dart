import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';
import 'package:whatsapp_clone/auth_page/repositry/auth_repositry.dart';
import 'package:whatsapp_clone/utils/utils.dart';

class UserInf extends ConsumerStatefulWidget {
  const UserInf({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInf> createState() => _UserInfState();
}

final nameController = TextEditingController();

class _UserInfState extends ConsumerState<UserInf> {
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  File? image;
  void pickimage() async {
    image = await pickImagefromGallery(context: context);
    setState(() {});
  }

  void saveinfotofirbase() {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(authControlerProvider)
          .saveUserData(context: context, name: name, profilpice: image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  image == null
                      ? Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(photoUrl),
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                              radius: 50, backgroundImage: FileImage(image!)),
                        ),
                  Positioned(
                      bottom: -10,
                      right: 150,
                      child: IconButton(
                          onPressed: pickimage,
                          icon: const Icon(Icons.add_a_photo)))
                ]),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.83,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Enter your Name"),
                        ),
                        controller: nameController,
                      ),
                    ),
                    IconButton(
                        onPressed: saveinfotofirbase,
                        icon: const Icon(
                          Icons.done,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
