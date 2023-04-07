import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page.dart';
import 'package:lunch_app/login/login_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(
            displayLarge: GoogleFonts.greatVibes(
              fontSize: 21,
              wordSpacing: 3,
              letterSpacing: 1.5,
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
            return LoginPage();
          }
        },
      ),
    );
  }
}
