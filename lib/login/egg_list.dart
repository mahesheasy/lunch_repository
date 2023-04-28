

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class egg_list extends StatefulWidget {
  const egg_list({super.key});

  @override
  State<egg_list> createState() => _egg_listState();
}

List<String> emailList = [];

class _egg_listState extends State<egg_list> {
  var now = DateTime.now();
  var user_Email;
  Future<void> eggList() async {
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('egg', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        var docs = querySnapshot.docs;
        for (var i = 10; i < docs.length; i++) {
         user_Email= docs[i]['email'];
        }
      
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
  void initState() {
     emailList.clear();
    eggList();
   
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('egg list'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: emailList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(emailList[index]),
            );
          },
        ),
      ),
    );
  }
}