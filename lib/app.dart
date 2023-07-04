import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_pageP.dart';
import 'package:flutter_application_1/pages/onboarding/onboarding_screen.dart';
import 'package:flutter_application_1/utils/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home/home_page.dart';
import 'pages/auth/login_page.dart';
import 'package:flutter_application_1/helper/helper_function.dart';
import 'package:flutter_application_1/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/pages/auth/login_page.dart';
import 'package:flutter_application_1/service/database_service.dart';
import 'package:flutter_application_1/pages/visitor/root.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  bool? isViewed;
  String role = '';

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
      getUserLoggedInRole() async {
        QuerySnapshot snapshot =
            await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(Transfer.email);
        // saving the values to our shared preferences
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(Transfer.email);
        await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
        role = snapshot.docs[0]['role'];
      }
    });
  }

  void onBoard() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences pref = await SharedPreferences.getInstance();
    isViewed = pref.getBool('onBoard');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: isViewed == true
          ? (_isSignedIn
              ? (role == 'Visiteur' ? const HomePage() : const HomePageP())
              : const LoginPage())
          : const OnBoardingScreen(),
      //));
    );
  }
}
