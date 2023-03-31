import 'package:flutter/material.dart';
import 'package:lunch_app/home_page.dart';
import 'package:lunch_app/Sign_in_page.dart';

class LunchApp extends StatelessWidget {
  const LunchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: Sign_in_page(),
    );
  }
}
