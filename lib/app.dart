import 'package:flutter/material.dart';
import 'package:lunch_app/Sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/Login_page.dart';
import 'package:lunch_app/home_page.dart';
import 'package:flutter/material.dart';

class LunchApp extends StatefulWidget {
  const LunchApp({super.key});

  @override
  State<LunchApp> createState() => _LunchAppState();
}

class _LunchAppState extends State<LunchApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New project',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 23,
              wordSpacing: 3,
              letterSpacing: 1.2,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.only(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
          ))))),
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
