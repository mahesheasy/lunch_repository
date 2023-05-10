import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

List buttonNames = ['yes','Copy'];
CollectionReference lunch = FirebaseFirestore.instance
    .collection('lunch_${now.day}-${now.month}-${now.year}');
var now = DateTime.now();

Widget logoutsubmitSharebtn(
    int buttonNamesIndex,
    BuildContext context,
    bool _lunchisChecked,
    bool _eggisChecked,
    totallunchcount,
    totaleggcount,
    meal_quantity,
    {VoidCallback? onPress}
   ) {
  if (buttonNamesIndex == 1) {
    return ElevatedButton.icon(
        onPressed: () {
          Toast.show("Copied!",
              duration: Toast.lengthShort, gravity: Toast.bottom);
          final whatsapptext = ClipboardData(
              // -- for -- egg -- Egg : ${int.parse(totaleggcount) * egg_price} Rs
              text: "Lunch : ${meal_quantity} ");
          Clipboard.setData(whatsapptext);
        },
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(GoogleFonts.lato(
            fontSize: 17,
        
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
          elevation: MaterialStatePropertyAll(4),
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 200, 192, 234),
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
          minimumSize: MaterialStatePropertyAll(
            Size(40, 40),
          ),
        ),
        icon: Icon(Icons.copy, color: Colors.black87),
        label: Text(
          buttonNames[buttonNamesIndex],
          style: TextStyle(
            color: Colors.black87, // text color
          ),
        ));
  } else{
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
          await callbackforyes(
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

Future<void> callbackforyes(int buttonNamesIndex,
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
      //'Guest':null,
    });
  }
}
