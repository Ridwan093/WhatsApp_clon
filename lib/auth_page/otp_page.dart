// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';

import 'package:sms_autofill/sms_autofill.dart';

import '../colors/colors.dart';

class Otp extends ConsumerWidget {
  final String verificationId;
  Otp({Key? key, required this.verificationId}) : super(key: key);
  String? code;
  void verifyOTp(
      {required WidgetRef ref,
      required BuildContext context,
      required String userOtp}) {
    code = userOtp;
    ref.read(authControlerProvider).verifyOTp(
        context: context, verificationId: verificationId, userOtp: userOtp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('verifying your number'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'we are sending verification code to this  your number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: PinFieldAutoFill(
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: UnderlineDecoration(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black),
                    colorBuilder:
                        FixedColorBuilder(Colors.black.withOpacity(0.3)),
                  ),
                  codeLength: 6,
                  currentCode: code,
                  onCodeSubmitted: (code) {},
                  onCodeChanged: (code) {
                    if (code!.length == 6) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      verifyOTp(
                          ref: ref, context: context, userOtp: code.trim());
                    } else {
                      return 'must be at least 6 digit!';
                      // showSnackBar(
                      //     context: context,
                      //     content: 'must be at least 6 digit!');
                    }
                  }),
            ),
            // SizedBox(
            //   width: size.width * 0.5,
            //   child: TextField(
            //     keyboardType: TextInputType.number,
            //     textAlign: TextAlign.center,
            //     decoration: const InputDecoration(
            //         hintText: '- - - - - -',
            //         hintStyle: TextStyle(fontSize: 30)),
            //     onChanged: (val) {
            //       if (val.length == 6 || val.isNotEmpty) {
            //         verifyOTp(ref: ref, context: context, userOtp: val.trim());
            //       } else {
            //         showSnackBar(
            //             context: context, content: 'must be at least 6 digit!');
            //       }
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
