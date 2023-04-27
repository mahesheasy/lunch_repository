import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lunch_app/home/app_bar_dispaly.dart';
import 'package:lunch_app/home/bottombarcontant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/home/time_out_display.dart';
import 'package:lunch_app/home/total_quantaty_count_widgit_display.dart';
import 'package:lunch_app/home/yes_text_list_display.dart';
import 'package:toast/toast.dart';
import 'package:lunch_app/home/check_box_tile.dart';

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
  late Timer timer;
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
        
          _isLunchProvided = true;
          setState(() {});
        } else {
        
          _isLunchProvided = false;

          _lunchisChecked = Snap.docs.first['lunch'] as bool;
          _eggisChecked = Snap.docs.first['egg'] as bool;
          timer.cancel();
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
    ToastContext().init(context);
    timer = Timer.periodic(
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
      final email = user.email!;
    }
    var now = DateTime.now();
    return Scaffold(
      appBar: appbar(user, context),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.white60),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 180,
                margin: EdgeInsets.only(top: 60, bottom: 60),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(191, 226, 220, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
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
                   // if (now.hour < 11)
                      Container(
                        child: Column(
                          children: [
                            CheckBoxtile(
                              initialvalue: _lunchisChecked,
                              isLunchProvided: _isLunchProvided,
                              title: "Lunch",
                              onchnage: (value) {
                                setState(() {
                                  _lunchisChecked = value!;
                                });
                              },
                            ),
                            CheckBoxtile(
                              initialvalue: _eggisChecked,
                              isLunchProvided: _isLunchProvided,
                              title: "Egg",
                              onchnage: (value) {
                                setState(() {
                                  _eggisChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                   // if (now.hour > 11) timeoutwidget(context),
                  ],
                ),
              ),

// ----------- imp --- color --- Color.fromARGB(255, 222, 225, 225) ---

              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(191, 226, 220, 1),
                ),
                padding: EdgeInsets.only(right: 5, left: 5),
                child: Column(
                  children: [
                   // if (now.hour < 11)
                      if (_isLunchProvided)
                        yesbtnandtext(
                          0,
                          context,
                          _lunchisChecked,
                          _eggisChecked,
                          null,
                          null,
                          _list[_currentIndex],
                          onPress: () {
                            usertesting();
                            fortotallunch();
                            fortotalegg();
                          },
                        ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Totalquantatydisplay(context, totallunchcount, totaleggcount),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color.fromRGBO(191, 226, 220, 1),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: [
               // if (now.hour > 11)
                  Bottomappbarcontant(context, totallunchcount.toString(),
                      totaleggcount.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
