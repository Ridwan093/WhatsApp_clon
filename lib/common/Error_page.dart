import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';

class Error extends StatelessWidget {
  final String error;
  const Error({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(error),
      ),
    );
  }
}
