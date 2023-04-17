import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

AppBar appbar(User? user, BuildContext context) {
  return AppBar(
    //Color.fromARGB(255, 222, 225, 225)
    backgroundColor: Colors.black,
    leading: null,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Text(
      user!.email!,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 21,
            color: Colors.white,
          ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.logout, color: Color.fromARGB(255, 248, 19, 2)))
    ],
  );
}
