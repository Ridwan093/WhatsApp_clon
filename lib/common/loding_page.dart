import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';

class Lodind extends StatelessWidget {
  const Lodind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: textColor,
        ),
      ),
    );
  }
}
