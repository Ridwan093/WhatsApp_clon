import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final firebasecommonrepositresprovider = Provider(((ref) =>
    Firebase_common_repositres(firebaseStorage: FirebaseStorage.instance)));

// ignore: camel_case_types
class Firebase_common_repositres {
  FirebaseStorage firebaseStorage;
  Firebase_common_repositres({required this.firebaseStorage});

  Future<String> storfileTofirbase(
      {required String ref, required File file}) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot task = await uploadTask;
    String downlodUrl = await task.ref.getDownloadURL();

    return downlodUrl;
  }
}
