import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lunch_app/CurrentDate.dart';
import 'package:lunch_app/logoutsubmitSharebtn.dart';
import 'package:lunch_app/totalquantity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/CurrentDate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _lunchisChecked = false;
  bool _eggisChecked = false;

  bool _testinguser = false;

  List<String> _list = ['Lock Cheyyala ? ', 'Lock Karna Kya ?'];
  int _currentIndex = 0;
  var now = DateTime.now();
//   Future<QuerySnapshot<Map<String, dynamic>>> lunch = FirebaseFirestore.instance.collection('lunch').where('name',isEqualTo: 'test').get().then((snapshot) {
// if (snapshot.size = 0) {

// } else {

// }
//   });
  void usertesting() {
    FirebaseFirestore.instance
        .collection('lunch')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('name', isEqualTo: 'test4')
        .get()
        .then(
      (QuerySnapshot) {
        if (QuerySnapshot.size == 0) {
          print('pls order');
          _testinguser = true;
          setState(() {});
        } else {
          print('y ordered food before only');

          _testinguser = false;
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    usertesting();
    // Create a Timer to update the list every 24 hours
    Timer.periodic(Duration(hours: 24), (timer) {
      setState(() {
        _currentIndex = (timer.tick + 1) %
            _list.length; // Update the current index of the list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    print(now.hour);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 158, 142),
        centerTitle: true,
        title: Text('EasyCloud'),
      ),
      body: Center(
        // widthFactor: double.infinity,
        child: Container(
          decoration: BoxDecoration(color: Colors.purple[50]),
          child: Column(children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 2, 221, 199)),
              margin: EdgeInsets.only(
                top: 5,
              ),
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bharath",
                      style: Theme.of(context).textTheme.displayLarge),
                  logoutsubmitSharebtn(0, context, false, true)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey),
              margin: EdgeInsets.only(
                top: 5,
              ),
              height: 20,
              width: double.infinity,
              padding: EdgeInsets.only(right: 10, left: 10),
              child: currentDate(),
            ),
            Container(
              width: 200,
              height: 180,
              margin: EdgeInsets.only(top: 60, bottom: 60),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular())),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 221, 155),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (now.hour >= 10)
                    Container(
                      child: Column(children: [
                        Container(
                          width: 160,
                          child: CheckboxListTile(
                            value: _lunchisChecked,
                            onChanged: (newValue) async {
                              assert(newValue != null);
                              setState(() {
                                _lunchisChecked = newValue!;
                              });
                            },
                            title: Text(
                              "Lunch",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 23, color: Colors.grey[800]),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          width: 160,
                          child: CheckboxListTile(
                            value: _eggisChecked,
                            onChanged: (newValue) async {
                              assert(newValue != null);
                              setState(() {
                                _eggisChecked = newValue!;
                              });
                            },
                            title: Text(
                              "Egg",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 23, color: Colors.grey[800]),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        )
                      ]),
                    ),
                  if (now.hour <= 10)
                    Container(
                      child: Text("Time Out",
                          style: Theme.of(context).textTheme.displayLarge),
                    )
                ],
              ),
              //if (now.hour > 10) Text('Timed out'),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 221, 199),
              ),
              padding: EdgeInsets.only(right: 5, left: 5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_list[_currentIndex],
                      style: Theme.of(context).textTheme.displayLarge),
                  if (_testinguser)
                    logoutsubmitSharebtn(
                        1, context, _lunchisChecked, _eggisChecked,
                        onPress: () {
                      usertesting();
                    })
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[400],
              endIndent: 10,
              height: 40,
              indent: 10,
            ),
            Container(
              width: 320,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Total food quantity",
                          style: Theme.of(context).textTheme.displayLarge),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  totalquantity(0, context, 0),
                  SizedBox(
                    height: 25,
                  ),
                  totalquantity(1, context, 1)
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color.fromARGB(255, 2, 158, 142),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoutsubmitSharebtn(2, context, false, true),
              SizedBox(
                width: 20,
              ),
              Text('and paste in WhatsApp',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 21))
            ],
          ),
        ),
      ),
    );
  }
}
