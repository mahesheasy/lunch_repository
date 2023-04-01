import 'package:flutter/material.dart';
import 'package:lunch_app/Sign_in_page.dart';
import 'package:lunch_app/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List buttonNames = ['Log out', 'Haa', 'Copy'];
CollectionReference lunch = FirebaseFirestore.instance.collection('lunch');

ElevatedButton logoutsubmitSharebtn(int buttonNamesIndex, BuildContext context,
    bool _lunchisChecked, bool _eggisChecked) {
  if (buttonNamesIndex == 2) {
    return ElevatedButton.icon(
        onPressed: () {
          myCallback(context);
        },
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: 18,
              wordSpacing: 1,
              letterSpacing: 1,
              color: Color.fromARGB(255, 5, 5, 5),
              fontWeight: FontWeight.bold,
            )),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 240, 202, 246)),
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
            textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: 18,
              wordSpacing: 1,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            )),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 240, 202, 246)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        onPressed: () async {
          await mycallbackusingforlogoutandhaa(
              buttonNamesIndex, context, _lunchisChecked, _eggisChecked);
          // Handle the result here
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
    print('Buttonindex 0 pressed!,pressed logout');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Sign_in_page()),
    // );
  }
  if (buttonNamesIndex == 1) {
    print('Buttonindex 1 pressed!,pressed haa');
    lunch.add({
      'egg': _lunchisChecked,
      'lunch': _eggisChecked,
      'name': 'Ram',
    }).then((value) => print('updated food'));
  }
}

void myCallback(BuildContext context) {
  print('Buttonindex 2 pressed!,pressed copy');
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Sign_in_page()),
  // );
}
