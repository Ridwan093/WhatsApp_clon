import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<File?> pickImagefromGallery({
  required BuildContext context,
}) async {
  File? image;

  try {
    final pickImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      image = File(pickImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }

  return image;
}

void showdialog(String content, BuildContext context) {
  var alret = AlertDialog(
    content: Text(content),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alret;
      });
}
