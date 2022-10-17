import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors/colors.dart';
import 'package:whatsapp_clone/route/route_helper.dart';

import '../auth_page/auth.dart';

class Getstart extends StatefulWidget {
  const Getstart({Key? key}) : super(key: key);

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const SafeArea(
              child: Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                'https://raw.githubusercontent.com/RivaanRanawat/flutter-whatsapp-clone/master/assets/bg.png',
                height: 300,
                width: 300,
                color: tabColor,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Read our ',
                          style: TextStyle(fontSize: 13, color: textColor),
                        ),
                        TextSpan(
                          text: 'privacy policy . ',
                          style: TextStyle(fontSize: 13, color: textColor),
                        ),
                        TextSpan(
                          text: "Tap 'Agree and continue' to accept the",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Terms of service.',
                          style: TextStyle(fontSize: 13, color: textColor),
                        )
                      ])),
                  InkWell(
                    onTap: () {
                      Routs().route(context: context, route: const Register());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: tabColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'AGREE AND CONTINUE',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
