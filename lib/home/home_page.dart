import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lunch_app/home/date_time.dart';
import 'package:lunch_app/home/food_quantity.dart';
import 'package:lunch_app/home/home_page_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _lunchisChecked = false;
  bool _eggisChecked = false;
  bool _isLunchProvided = false;
  List<String> _list = ['Lock Cheyyala ? ', 'Lock Karna Kya ?'];
  int _currentIndex = 0;
  var now = DateTime.now();

  void usertesting() {
    final user = FirebaseAuth.instance.currentUser;
    var email = user!.email!;
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('email', isEqualTo: email)
        .get()
        .then(
      (Snap) {
        if (Snap.size == 0) {
          print('pls order');
          _isLunchProvided = true;
          setState(() {});
        } else {
          print('y ordered food before only');
          _isLunchProvided = false;

          _lunchisChecked = Snap.docs.first['lunch'] as bool;
          _eggisChecked = Snap.docs.first['egg'] as bool;
          setState(() {});
        }
      },
    );
  }

  var totallunchcount = 0;
  Future<void> fortotallunch() async {
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('lunch', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        totallunchcount = querySnapshot.size;
        print('bharath $totallunchcount');
        setState(() {});
      },
    );
  }

  var totaleggcount = 0;
  Future<void> fortotalegg() async {
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('egg', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        totaleggcount = querySnapshot.size;
        print('bharath $totaleggcount');
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    usertesting();
    fortotallunch();
    fortotalegg();
    // Create a Timer to update the list every 24 hours
    Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        setState(
          () {
            _currentIndex = (timer.tick + 1) %
                _list.length; // Update the current index of the list
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;
      print(name);
      print(email);
      print(photoUrl);
    }
    var now = DateTime.now();
    print(now.hour);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 225, 225),
        leading: null,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title:
            Text(user!.email!, style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout, color: Colors.black))
        ],
      ),
      body: Center(
        // widthFactor: double.infinity,
        child: Container(
          decoration: BoxDecoration(color: Colors.purple[50]),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 180,
                margin: EdgeInsets.only(top: 60, bottom: 60),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular())),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 254, 253),
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
                    // if (now.hour >= 10 && now.minute >= 30)

// we have to change time in ""if""" change operators opposite

                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 160,
                            child: CheckboxListTile(
                              value: _lunchisChecked,
                              enabled: _isLunchProvided,
                              onChanged: (newValue) async {
                                assert(newValue != null);
                                setState(
                                  () {
                                    _lunchisChecked = newValue!;
                                  },
                                );
                              },
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color:
                                      Colors.red, // set the border color here
                                  width: 5.0, // set the border width here
                                ),
                              ),
                              title: Text(
                                "Lunch",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 23,
                                      color: Colors.grey[800],
                                    ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Container(
                            width: 160,
                            child: CheckboxListTile(
                              value: _eggisChecked,
                              enabled: _isLunchProvided,
                              onChanged: (newValue) async {
                                assert(newValue != null);
                                setState(
                                  () {
                                    _eggisChecked = newValue!;
                                  },
                                );
                              },
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color:
                                      Colors.red, // set the border color here
                                  width: 5.0, // set the border width here
                                ),
                              ),
                              title: Text(
                                "Egg",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 23, color: Colors.grey[800]),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (now.hour <= 10 && now.minute <= 30)

// we have to change time in ""if""" change operators opposite

                      Container(
                        child: Text("Time Out",
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                  ],
                ),
                //if (now.hour > 10) Text('Timed out'),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 225, 225),
                ),
                padding: EdgeInsets.only(right: 5, left: 5),
                child: Column(
                  children: [
                    //if (now.hour >= 10 && now.minute >= 30)
                    if (_isLunchProvided)

// we have to change time in ""if""" change operators opposite

                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_list[_currentIndex],
                              style: Theme.of(context).textTheme.displayLarge),
                          SizedBox(
                            width: 10,
                          ),
                          logoutsubmitSharebtn(
                            0,
                            context,
                            _lunchisChecked,
                            _eggisChecked,
                            onPress: () {
                              usertesting();
                              fortotallunch();
                              fortotalegg();
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              // Divider(
              //   thickness: 2,
              //   color: Colors.grey[400],
              //   endIndent: 10,
              //   height: 40,
              //   indent: 10,
              // ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 320,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total food quantity",
                            style: Theme.of(context).textTheme.displayLarge),
                        Row(
                          children: [Current_Date()],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    totalquantity(0, context, totallunchcount.toString()),
                    SizedBox(
                      height: 25,
                    ),
                    totalquantity(1, context, totaleggcount.toString())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color.fromARGB(255, 222, 225, 225),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: [
                if (now.hour >= 10 && now.minute >= 30)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      logoutsubmitSharebtn(1, context, false, true),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'and paste in WhatsApp',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 21),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
