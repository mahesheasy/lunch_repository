import 'package:flutter/material.dart';
import 'package:lunch_app/Sign_in_page.dart';
import 'package:lunch_app/home_page.dart';

List buttonNames = ['Log out', 'Haa', 'Copy'];

ElevatedButton logoutsubmitSharebtn(
    int buttonNamesIndex, BuildContext context) {
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
              color: Color.fromARGB(255, 205, 105, 105),
              fontWeight: FontWeight.bold,
            )),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 247, 247, 246)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
            minimumSize: MaterialStatePropertyAll(Size(20, 20))),
        onPressed: () {
          mycallbackusingifelse(buttonNamesIndex, context);
        },
        child: Text(buttonNames[buttonNamesIndex]));
  }
}

void mycallbackusingifelse(int buttonNamesIndex, BuildContext context) {
  if (buttonNamesIndex == 0) {
    print('Buttonindex 0 pressed!');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Sign_in_page()),
    // );
  }
  if (buttonNamesIndex == 1) {
    print('Buttonindex 1 pressed!');
  }
}

void myCallback(BuildContext context) {
  print('Buttonindex 2 pressed!');
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Sign_in_page()),
  // );
}
