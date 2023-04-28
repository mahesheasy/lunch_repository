import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class foodtruelist extends StatefulWidget {
  const foodtruelist({super.key});

  @override
  State<foodtruelist> createState() => _foodtruelistState();
}

List<String> emailList = [];

class _foodtruelistState extends State<foodtruelist> {
  var now = DateTime.now();
  Future<void> foremaillilst() async {
    FirebaseFirestore.instance
        .collection('lunch_${now.day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${now.day}-${now.month}-${now.year}')
        .where('lunch', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        var docs = querySnapshot.docs;

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
    foremaillilst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(191, 226, 220, 1),
        title: Text(
          'Food',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 21,
                color: Colors.black,
              ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: emailList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey[300],
              margin: EdgeInsets.only(top: 3),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    emailList[index].substring(0, 2),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                  ),
                ),
                title: Text(
                  emailList[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}