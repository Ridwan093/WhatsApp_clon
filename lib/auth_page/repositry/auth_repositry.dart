import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/auth_page/otp_page.dart';
import 'package:whatsapp_clone/auth_page/user_informaton.dart';
import 'package:whatsapp_clone/main_page/homepage.dart';
import 'package:whatsapp_clone/repositres/firebase_comment_repositres.dart';
import 'package:whatsapp_clone/route/route_helper.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_model.dart';
import '../../utils/utils.dart';

String photoUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8SiTWYOrsL_Ea5ILRPJlK9bLlBUFgxvyu1TFL4F2JBQ&s';

final authrepositryprovider = Provider((ref) {
  return AuthRepositry(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
});

class AuthRepositry {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  AuthRepositry({required this.auth, required this.firestore});

  void signInwithPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      await auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 20),
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential).then((value) async {
              if (value.user != null) {
                log("Done !!", name: "verificationCompleted");
              } else {
                log("Failed!!", name: "verificationCompleted");
              }
            });

            ///////////
          },
          verificationFailed: (e) {
            print(e.toString());
            showSnackBar(context: context, content: e.message.toString());
          },
          codeSent: ((String verificationid, int? resenToken) {
            Routs().route(
                context: context,
                route: Otp(
                  verificationId: verificationid,
                ));
          }),
          codeAutoRetrievalTimeout: (String timout) async {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!.toString());
    }
  }

  void otpverification({
    required BuildContext context,
    required String verificationId,
    required String otp,
  }) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await auth.signInWithCredential(credential);
      showdialog('Verifiad', context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UserInf()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!.toString());
    }
  }

  void saveuserDatatofirebase(
      {required String name,
      required File? profilpice,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      if (profilpice != null) {
        photoUrl = await ref
            .read(firebasecommonrepositresprovider)
            .storfileTofirbase(ref: 'profilepic/$uid', file: profilpice);
        var user = UserModel(
            name: name,
            uid: uid,
            profilpix: photoUrl,
            phonenumber: auth.currentUser!.phoneNumber.toString(),
            isOnline: true,
            groupid: []);
        firestore.collection('user').doc(uid).set(user.map());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Hompage()));
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<UserModel?> getcurrentUser() async {
    var userData =
        await firestore.collection('user').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Stream<UserModel> userData({required String userId}) {
    return firestore
        .collection('user')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }
}
