import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

List buttonNames = ['Yes', 'Copy'];
CollectionReference lunch = FirebaseFirestore.instance
    .collection('lunch_${now.day}-${now.month}-${now.year}');
var now = DateTime.now();

//

ElevatedButton logoutsubmitSharebtn(int buttonNamesIndex, BuildContext context,
    bool _lunchisChecked, bool _eggisChecked,
    {VoidCallback? onPress}) {
  if (buttonNamesIndex == 1) {
    return ElevatedButton.icon(
        onPressed: () {
          print('Buttonindex 2 pressed!,pressed copy');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Sign_in_page()),
        },
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GoogleFonts.vastShadow(
              fontSize: 16,
              color: Color.fromARGB(255, 5, 5, 5),
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
            textStyle: MaterialStatePropertyAll(GoogleFonts.vastShadow(
              fontSize: 16,
              color: Color.fromARGB(255, 5, 5, 5),
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
    print('Buttonindex 1 pressed!,pressed haa');
    final user = FirebaseAuth.instance.currentUser;
    var user_email = user!.email!;
    lunch.add({
      'egg': _eggisChecked,
      'lunch': _lunchisChecked,
      'name': "test5",
      'email': user_email,
      'date': "${now.day}-${now.month}-${now.year}",
    }).then((value) {
      print('updated food');
    });
  }
}
