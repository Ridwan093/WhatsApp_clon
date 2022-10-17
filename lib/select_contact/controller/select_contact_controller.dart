import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/select_contact/repositry/select_contact_repositry.dart';

final getContactProvider = FutureProvider((ref) {
  final selectContactRepositry = ref.watch(selectContatProvider);
  return selectContactRepositry.getcontancte();
});
final selectContactControllerProvider = Provider((ref) {
  final selecteContactRepositry = ref.watch(selectContatProvider);
  return SelectContactController(
      ref: ref, selecteContactRepositry: selecteContactRepositry);
});

class SelectContactController {
  final ProviderRef ref;
  final SelecteContactRepositry selecteContactRepositry;

  SelectContactController(
      {required this.ref, required this.selecteContactRepositry});

  void selectContact(
      {required Contact selectcontact, required BuildContext context}) {
    selecteContactRepositry.selectConatact(
        selectcontact: selectcontact, context: context);
  }
}
