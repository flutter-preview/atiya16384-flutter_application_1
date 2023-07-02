//we can create an abstract class
//contains functions for sing in login etc.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';

import 'auth_UI.dart';
//import 'home_page.dart';

//statless widgets cannot change their state during the runtime of the app
//so widget cannot be redrawn while app is in action
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            //constantly listening to auth stage changes
            //whether the user is logged in or not
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //user is logged in
              if (snapshot.hasData) {
                return PageConst();

                // user is not logged in, then we return either login or register page
              } else {
                // need to change this to login or register page
                return AuthSwitch();
              }
            }));
  }
}
