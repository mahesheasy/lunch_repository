import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lunch_app/app.dart';
// ignore: unused_import
import 'package:lunch_app/Sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LunchApp());
}
