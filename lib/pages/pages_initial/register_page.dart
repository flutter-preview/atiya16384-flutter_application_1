// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../components/square_signature.dart';
import '../../components/square_tile.dart';
import '../../components/text_field.dart';

// import '../components/button.dart';
// import '../components/square_signature.dart';
// import '../components/square_tile.dart';
// import '../components/text_field.dart';

//changes its properties during run time
//widget is dynamic
//different parts of the login page will change state depending on what action has been taken
class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// Messages for the possible authentication errors
  void wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Wrong Email"));
        });
  }

  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Wrong password"));
        });
  }

  void invalidEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Email"));
        });
  }

  void invalidPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Password"));
        });
  }

  void doNotMatchPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Text("Password and Confirm Password do not match."));
        });
  }

  // Registeruser in method
  void signUserInRegister() async {
    // show loading circle

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
                color: Color.fromRGBO(228, 92, 162, 100), strokeWidth: 3),
          );
        });

    //put this in a try and exception to eradicate possible user errors
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Navigator.pop(context);
      } else {
        doNotMatchPassword();
      }
      // ignore: curly_braces_in_flow_control_structures
    } on FirebaseAuthException catch (e) {
      //WRONG EMAIL
      Navigator.pop(context);

      //INVALID EMAIL
      if (e.code == "invalid-email") {
        // ignore: avoid_print
        print("The username provided is not valid");
        invalidEmail();

        //INVALID PASSWORD
      } else if (e.code == "invalid-password") {
        // ignore: avoid_print
        print("The password provided is not valid");
        invalidPassword();
      } else if (passwordController != confirmPasswordController) {
        print("The password and confirm password do not match");
        doNotMatchPassword();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          //wrap this in singlechildscrollview
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SquareTile(
                //     imagePath: 'lib/images/Menopause_Unzipped.png'),

                //  const SizedBox(height: 20),

                const SizedBox(height: 10),
                const Text(
                  'Register with your details below!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email-Address',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // sign in button is not working
                //2 parameters are requested for button and two are provided
                Button(onTap: signUserInRegister, label: 'Sign Up'),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login here',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const signatureSquareTile(
                    imagePath: 'lib/images/Signature.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
