import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/Login_page.dart';
import 'package:lunch_app/home_page.dart';
import 'package:flutter/material.dart';

class LunchApp extends StatelessWidget {
  const LunchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New project',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          } else {
            return Login_page();
          }
        },
      ),
    );
  }
}
