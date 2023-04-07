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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New project',
      theme: ThemeData(
       primarySwatch:Colors.deepPurple,
       
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 23,
            wordSpacing: 3,
            letterSpacing: 1.2,
            color: Color.fromARGB(221, 7, 6, 6),
            fontWeight: FontWeight.bold,
            
          ),
          
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     padding: MaterialStatePropertyAll(
        //       EdgeInsets.only(
        //         bottom: 10,
        //         left: 10,
        //         right: 10,
        //         top: 10,
        //       ),
        //     ),
        //   ),
        // ),
      ),
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
