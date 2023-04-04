import 'package:flutter/material.dart';
import 'package:lunch_app/home_page.dart';

class Sign_in_page extends StatefulWidget {
  const Sign_in_page({super.key});

  @override
  State<Sign_in_page> createState() => _Sign_in_page();
}

class _Sign_in_page extends State<Sign_in_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "EaSy CLoUd",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe_Pb0PaM4XraP3MKSUoES_Tqr9ItdLwHXjI2R_mlTK7R3Qyqu295tVQeFxCnnxZd-q8c&usqp=CAU',
              // width: 380,
              height: 200,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: ' Name',
                      hintText: 'Enter your name:',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: ' Employe-Id ',
                      hintText: 'Enter your id:',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: ' User_name ',
                      hintText: ' User Name:',
                      prefixIcon: Icon(Icons.person_pin_rounded),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: ' Password ',
                      hintText: 'Enter your password:',
                      prefixIcon: Icon(Icons.password_sharp),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
