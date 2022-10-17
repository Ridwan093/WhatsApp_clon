import 'package:flutter/material.dart';

class Routs {
  route({required BuildContext context, required Widget route}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => route));
  }
}
