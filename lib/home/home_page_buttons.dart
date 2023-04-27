import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

List buttonNames = ['yes', 'Copy'];
CollectionReference lunch = FirebaseFirestore.instance
    .collection('lunch_${now.day}-${now.month}-${now.year}');
var now = DateTime.now();

ElevatedButton logoutsubmitSharebtn(int buttonNamesIndex, BuildContext context,
    bool _lunchisChecked, bool _eggisChecked, totallunchcount, totaleggcount,
    {VoidCallback? onPress}) {
  if (buttonNamesIndex == 1) {
    final egg_price = FirebaseRemoteConfig.instance.getInt('egg_price');
    final food_multiplier =
        FirebaseRemoteConfig.instance.getDouble('food_multiplier');

    return ElevatedButton.icon(
        onPressed: () {
          Toast.show("Copied!",
              duration: Toast.lengthShort, gravity: Toast.bottom);
          var total_quantity =
              (int.parse(totallunchcount) * food_multiplier).round();
          final whatsapptext = ClipboardData(
              text:
                  " Lunch : ${total_quantity}  Egg : ${int.parse(totaleggcount) * egg_price} ");
          Clipboard.setData(whatsapptext);
        },
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GoogleFonts.lato(
              fontSize: 17,
              // Color.fromARGB(255, 5, 5, 5)
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 200, 192, 234)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        icon: Icon(Icons.copy, color: Colors.black87),
        label: Text(
          buttonNames[buttonNamesIndex],
          style: TextStyle(
            color: Colors.black87, // text color
          ),
        ));
  } else {
    return ElevatedButton(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GoogleFonts.lato(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 200, 192, 234)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        onPressed: () async {
          await mycallbackusingforlogoutandhaa(
              buttonNamesIndex, context, _lunchisChecked, _eggisChecked);
          // Handle the result here
          onPress?.call();
        },
        child: Text(
          buttonNames[buttonNamesIndex],
          style: TextStyle(
            color: Colors.black87, // text color
          ),
        ));
  }
}

Future<void> mycallbackusingforlogoutandhaa(int buttonNamesIndex,
    BuildContext context, _lunchisChecked, _eggisChecked) async {
  if (buttonNamesIndex == 0) {
    Toast.show("Successfully Updated!",
        duration: Toast.lengthShort, gravity: Toast.bottom);

    final user = FirebaseAuth.instance.currentUser;
    var user_email = user!.email!;
    lunch.add({
      'egg': _eggisChecked,
      'lunch': _lunchisChecked,
      'email': user_email,
      'date': "${now.day}-${now.month}-${now.year}",
    });
  }
}
