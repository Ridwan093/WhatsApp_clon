import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/repositry/auth_repositry.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final authControlerProvider = Provider((ref) {
  final authRepositry = ref.watch(authrepositryprovider);
  return AuthController(authRepositry: authRepositry, ref: ref);
});
final userDataAuthprovider = FutureProvider((ref) {
  final usercontroller = ref.watch(authControlerProvider).getuserData();
  return usercontroller;
});

class AuthController {
  final AuthRepositry authRepositry;
  final ProviderRef ref;

  AuthController({required this.authRepositry, required this.ref});

  void signInWithPhoneNumber(
      {required BuildContext context, required String phoneNumber}) {
    authRepositry.signInwithPhoneNumber(
        phoneNumber: phoneNumber, context: context);
  }

  Future<UserModel?> getuserData() async {
    UserModel? user = await authRepositry.getcurrentUser();
    return user;
  }

  void verifyOTp(
      {required BuildContext context,
      required String verificationId,
      required String userOtp}) {
    authRepositry.otpverification(
        context: context, verificationId: verificationId, otp: userOtp);
  }

  void saveUserData(
      {required BuildContext context,
      required String name,
      required File? profilpice}) {
    authRepositry.saveuserDatatofirebase(
        name: name, profilpice: profilpice, ref: ref, context: context);
  }

  Stream<UserModel> userDatabyId({required String userId}) {
    return authRepositry.userData(userId: userId);
  }
}
