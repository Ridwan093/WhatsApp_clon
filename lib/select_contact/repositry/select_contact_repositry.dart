import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// See installation notes below regarding AndroidManifest.xml and Info.plist
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/cart/screen/view_message.dart';
import 'package:whatsapp_clone/model/helper.dart';
import 'package:whatsapp_clone/model/user_model.dart';
import 'package:whatsapp_clone/route/route_helper.dart';
import 'package:whatsapp_clone/utils/utils.dart';

final selectContatProvider = Provider(
    (ref) => SelecteContactRepositry(firestore: FirebaseFirestore.instance));

class SelecteContactRepositry {
  FirebaseFirestore firestore;

  SelecteContactRepositry({required this.firestore});
  Future<List<Contact>> getcontancte() async {
    List<Contact> contact = [];
    if (await FlutterContacts.requestPermission()) {
      contact = await FlutterContacts.getContacts(withProperties: true);
    }
    try {} catch (e) {}
    return contact;
  }

  void selectConatact(
      {required Contact selectcontact, required BuildContext context}) async {
    try {
      var userCollection = await firestore.collection('user').get();
      bool isFound = false;
      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        print(selectcontact.phones[0].number.toString());
        String selectedphonenumber =
            selectcontact.phones[0].number.replaceAll(' ', '');

        if (selectedphonenumber == userData.phonenumber) {
          isFound = true;
          Routs().route(
              context: context,
              route: View_message(
                uid: userData.uid,
                userName: userData.name,
              ));
        }
      }
      if (!isFound) {
        showSnackBar(
            context: context,
            content: 'this number dose not exist on this app.');
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
