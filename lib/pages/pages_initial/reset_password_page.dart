// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../components/square_signature.dart';
import '../../components/square_tile.dart';
import '../../components/text_field.dart';

//changes its properties during run time
//widget is dynamic
//different parts of the login page will change state depending on what action has been taken
class resetPasswordPage extends StatefulWidget {
  // final Function()? onTap;

  const resetPasswordPage({
    super.key,
  });

  @override
  State<resetPasswordPage> createState() => _resetPasswordPage();
}

class _resetPasswordPage extends State<resetPasswordPage> {
  // text editing controllers
  final emailController = TextEditingController();
  late String _email;
// Messages for the possible authentication errors

  void invalidEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Email"));
        });
  }

  void forgotThePassword() async {
    // show loading circle
    //some of the parameters may be void
    //we need to check this

    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
    // ignore: curly_braces_in_flow_control_structures

    //INVALID EMAIL

    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(228, 92, 162, 100),
              strokeWidth: 3,
            ),
          );
        });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop;
    //we have the loading icon displayed on screen
  }

  //put this in a try and exception to eradicate possible user errors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // this app bar takes us back to the previous page

      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          //wrap this in singlechildscrollview

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //add a button to go back to the login page
                //

                const SizedBox(height: 30),

                // const SquareTile(
                //     imagePath: 'lib/images/Menopause_Unzipped.png'),

                // welcome back, you've been missed!
                const Text(
                  'Reset Password!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email-Address',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                //doesn't work
                // need to put this in a row and return the homepage
                //continue working on forgot password
                Button(onTap: forgotThePassword, label: 'Send Request'),

                const SizedBox(height: 20),
                const signatureSquareTile(
                    imagePath: 'lib/images/Signature.png'),
                // not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
