import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunch_app/Login_page.dart';
import 'package:lunch_app/home_page.dart';

import 'package:lunch_app/user.dart';

class LunchApp extends StatelessWidget {
  const LunchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
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
