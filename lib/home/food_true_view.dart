import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Foodtrueview extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<Foodtrueview> {
  var now = DateTime.now();
  Future<void> foremaillilst() async {
    List<String> emailList = [];
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('lunch', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        var docs = querySnapshot.docs;
        // for (var i = 0; i < docs.length; i++) {
        //   user_Email = docs[i]['email'];
        // }
        // print(user_Email);
        docs.forEach((doc) {
          String email = doc['email'];
          emailList.add('$email');
        });
        print(emailList);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food True View'),
      ),
    );
  }
}
