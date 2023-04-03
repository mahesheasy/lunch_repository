import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/submitSharebtn.dart';
import 'package:lunch_app/CurrentDate.dart';
import 'package:lunch_app/checkboxs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyCloud'),
      ),

      body: Center(
        // widthFactor: double.infinity,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: double.infinity,
            padding: EdgeInsets.only(right: 10),
            child: currentDate(),
          ),
          
          Container(
            width: double.infinity,
            color: Colors.amber,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 145,
                  child: checkbox(0),
                ),
                Container(
                  width: 145,
                  child: checkbox(1),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [Text(' This is Bharath '), submitSharebtn()],
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text("Logout"),
            ),
          )
        ]),
      ),
    );
  }
}
