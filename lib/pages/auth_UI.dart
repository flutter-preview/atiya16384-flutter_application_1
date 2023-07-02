import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages_initial/login_page.dart';
import 'package:flutter_application_1/pages/pages_initial/register_page.dart';

//we create a toggle to go from login page to register easily
//Stateful widget is appropriate as we are moving from one page to the next
class AuthSwitch extends StatefulWidget {
  const AuthSwitch({super.key});

  @override
  State<AuthSwitch> createState() => _AuthSwitchState();
}

class _AuthSwitchState extends State<AuthSwitch> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

//No named parameter with the name 'toggleView'
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(
        onTap: toggleView,
      );
    } else {
      return RegisterPage(
        onTap: toggleView,
      );
    }
  }
}
