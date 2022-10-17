import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';

import 'package:whatsapp_clone/colors/colors.dart';

import '../utils/utils.dart';

final TextEditingController phonecontoller = TextEditingController();

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  Country? countrys;
  void _showcountrypicker() {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        setState(() {
          countrys = country;
        });
        print('Select country: ${country.displayName}');
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phonecontoller.text.trim();
    print(phoneNumber);

    if (countrys != null && phoneNumber.isNotEmpty) {
      ref.read(authControlerProvider).signInWithPhoneNumber(
          context: context, phoneNumber: "+${countrys!.phoneCode}$phoneNumber");
    } else if (countrys == null || phoneNumber == '') {
      showSnackBar(context: context, content: 'Fill all the Filds');
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   phonecontoller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Enter your phone number',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          PopupMenuButton(
            padding: const EdgeInsets.only(right: 20),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text('help')),
            ],
            color: appBarColor,
            elevation: 10.0,
            onSelected: (value) {
              if (value == 1) {
              } else if (value == 2) {
              } else if (value == 3) {}
            },
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text:
                              'WhatsApp will need to verify your phone number ',
                          style: TextStyle(color: textColor, fontSize: 12)),
                      TextSpan(
                          text: "what's my number?",
                          style: TextStyle(color: Colors.blue, fontSize: 12))
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: _showcountrypicker,
                child: const Text(
                  'Pick country',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height - 200,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (countrys != null) Text("+${countrys?.phoneCode}"),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 200,
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'Phone number'),
                              controller: phonecontoller,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          sendPhoneNumber();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: tabColor),
                          child: const Center(child: Text('Next')),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
