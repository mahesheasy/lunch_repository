import 'package:flutter/material.dart';
import 'package:lunch_app/home_page.dart';
// import 'package:lunch_app/home_page.dart';
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
      ),
      home: Sign_in_page(),
    );
  }
}
