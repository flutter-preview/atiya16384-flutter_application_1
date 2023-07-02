import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class prescripList extends StatelessWidget {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: const Text("Page 3"),
      actions: [
        IconButton(
          onPressed: signOut,
          icon: const Icon(Icons.logout),
        )
      ],
    ));
  }
}
