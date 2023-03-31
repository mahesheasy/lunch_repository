import 'package:flutter/material.dart';

List buttonNames = ['Log out', 'Haa', 'Copy'];

ElevatedButton logoutsubmitSharebtn(
    int buttonNamesIndex, BuildContext context) {
  if (buttonNamesIndex == 2) {
    return ElevatedButton.icon(
        onPressed: null,
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
                MaterialStatePropertyAll(Color.fromARGB(255, 247, 247, 246)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        icon: Icon(Icons.copy),
        label: Text(buttonNames[buttonNamesIndex]));
  } else {
    return ElevatedButton(
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
                MaterialStatePropertyAll(Color.fromARGB(255, 247, 247, 246)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        onPressed: null,
        child: Text(buttonNames[buttonNamesIndex]));
  }
}
