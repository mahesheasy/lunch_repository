import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lunch_app/CurrentDate.dart';
import 'package:lunch_app/logoutsubmitSharebtn.dart';
import 'package:lunch_app/totalquantity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _lunchisChecked = false;
  bool _eggisChecked = false;

  List<String> _list = ['Lock Cheyyala ? ', 'Lock Karna Kya ?'];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('EasyCloud'),
      ),
      body: Center(
        // widthFactor: double.infinity,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 80, 167, 221)),
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
                logoutsubmitSharebtn(0, context)
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
              color: Color.fromARGB(255, 80, 167, 221),
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
                          .copyWith(fontSize: 23, color: Colors.grey[800]),
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
                          .copyWith(fontSize: 23, color: Colors.grey[800]),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 80, 167, 221),
            ),
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_list[_currentIndex],
                    style: Theme.of(context).textTheme.displayLarge),
                logoutsubmitSharebtn(1, context)
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
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Colors.amber,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoutsubmitSharebtn(2, context),
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
