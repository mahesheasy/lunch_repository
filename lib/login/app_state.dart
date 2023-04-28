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

  late Stream<User?> authStateChanges;

  @override
  void initState() {
    super.initState();

    authStateChanges = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealMaven',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          // displayLarge: GoogleFonts.eduQldBeginner
          bodyMedium: GoogleFonts.lato(
            // fontSize: 21,
            wordSpacing: 3,
            letterSpacing: 1.5,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: authStateChanges,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  !snapshot.hasError) {
                return HomePage();
              } else {
                return LoginPage();
              }
            default:
              return LoginPage();
          }
        },
      ),
    );
  }
}
