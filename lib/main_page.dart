import 'package:flutter/material.dart';
import 'package:lunch_app/login/app_state.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: unused_import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LunchApp());
}
