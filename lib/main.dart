import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/auth_page/controller/auth_controller.dart';
import 'package:whatsapp_clone/common/Error_page.dart';
import 'package:whatsapp_clone/common/loding_page.dart';
import 'package:whatsapp_clone/main_page/homepage.dart';

import 'getstart_page/getstart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'WhatsApp_clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(),
        home: ref.watch(userDataAuthprovider).when(data: (user) {
          if (user == null) {
            return const Getstart();
          }
          return const Hompage();
        }, error: (err, stre) {
          return Error(error: err.toString());
        }, loading: () {
          return const Lodind();
        }));
  }
}

// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth? _auth;

//   User? _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth!.currentUser;
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? LoginScreen()
//             : Hompage();
//   }
// }
