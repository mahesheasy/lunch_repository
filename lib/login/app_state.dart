import 'package:flutter/material.dart';

import 'package:lunch_app/home/home_page.dart';
import 'package:lunch_app/login/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LunchApp extends StatefulWidget {
  const LunchApp({super.key});

  @override
  State<LunchApp> createState() => _LunchAppState();
}

class _LunchAppState extends State<LunchApp> {
  // This widget is the root of your application.
  final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,

);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.indigo,
 
);

  late Stream<User?> authStateChanges;
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();

    authStateChanges = FirebaseAuth.instance.authStateChanges();
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDarkTheme ? darkTheme : lightTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealMaven',
      theme: theme,

      // ThemeData(
      //   primarySwatch: Colors.deepPurple,
      //   textTheme: TextTheme(
      //
      //     bodyMedium: GoogleFonts.lato(
      //
      //       wordSpacing: 3,
      //       letterSpacing: 1.5,
      //       color: Colors.black,
      //       fontWeight: FontWeight.w800,
      //     ),
      //   ),
      //),
      // ThemeData(useMaterial3: true),

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
