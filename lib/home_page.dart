import 'package:flutter/material.dart';
import 'package:lunch_app/CurrentDate.dart';
import 'package:lunch_app/checkboxs.dart';
import 'package:lunch_app/logoutsubmitSharebtn.dart';
import 'package:lunch_app/submitbesidetext.dart';
import 'package:lunch_app/totalquantity.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('EasyCloud'),
        // actions: [logoutsubmitSharebtn(0,context)],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('EasyCloud'), logoutsubmitSharebtn(0, context)],
        ),
      ),
      body: Center(
        // widthFactor: double.infinity,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            margin: EdgeInsets.only(
              top: 5,
            ),
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.only(right: 10),
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
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  child: checkbox(0, context),
                ),
                Container(
                  width: 160,
                  child: checkbox(1, context),
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
                submitbesidetext(0, context),
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
                  style: Theme.of(context).textTheme.displayLarge)
            ],
          ),
        ),
      ),
    );
  }
}
