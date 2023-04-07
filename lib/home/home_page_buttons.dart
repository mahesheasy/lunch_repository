import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List buttonNames = ['Log out', 'Haa', 'Copy'];
CollectionReference lunch = FirebaseFirestore.instance.collection('lunch');
var now = DateTime.now();

ElevatedButton Clickable_Buttons(int buttonNamesIndex, BuildContext context,
    bool _lunchisChecked, bool _eggisChecked,
    {VoidCallback? onPress}) {
  if (buttonNamesIndex == 2) {
    return ElevatedButton.icon(
      onPressed: () {
        print('Buttonindex 2 pressed!,pressed copy');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Sign_in_page()),
      },
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 18,
            wordSpacing: 1,
            letterSpacing: 1,
            color: Color.fromARGB(255, 5, 5, 5),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: MaterialStatePropertyAll(4),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 15, 14, 15),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.all(4),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(20, 20),
        ),
      ),
      icon: Icon(Icons.copy, color: Colors.black87),
      label: Text(
        buttonNames[buttonNamesIndex],
        style: TextStyle(
          color: Colors.black87, // text color
        ),
      ),
    );
  } else {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 18,
            wordSpacing: 1,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: MaterialStatePropertyAll(4),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 1, 1, 1),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.all(4),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(20, 20),
        ),
      ),
      onPressed: () async {
        await call_back_function(
            buttonNamesIndex, context, _lunchisChecked, _eggisChecked);
        // Handle the result here
        onPress?.call();
      },
      child: Text(
        buttonNames[buttonNamesIndex],
        style: TextStyle(
          color: Colors.black87, // text color
        ),
      ),
    );
  }
}

Future<void> call_back_function(int buttonNamesIndex, BuildContext context,
    _lunchisChecked, _eggisChecked) async {
  if (buttonNamesIndex == 0) {
    print('Buttonindex 0 pressed!,pressed logout');

    await FirebaseAuth.instance.signOut();
  }
  if (buttonNamesIndex == 1) {
    print('Buttonindex 1 pressed!,pressed haa');
    lunch.add(
      {
        'egg': _lunchisChecked,
        'lunch': _eggisChecked,
        'name': "test4",
        'date': "${now.day}-${now.month}-${now.year}",
      },
    ).then(
      (value) {
        print('updated food');
      },
    );
  }
}
