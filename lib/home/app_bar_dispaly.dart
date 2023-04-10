import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

AppBar appbar(User? user, BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 222, 225, 225),
    leading: null,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Text(user!.email!, style: Theme.of(context).textTheme.displayLarge),
    actions: [
      IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          icon: Icon(Icons.logout, color: Colors.black))
    ],
  );
}
