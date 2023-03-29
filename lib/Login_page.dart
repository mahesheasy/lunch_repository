import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_page();
}

class _Login_page extends State<Login_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Login"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://easycloud.in/wp-content/uploads/2018/06/logo_final.png',
              // width: 380,
              height: 100,
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
                      labelText: ' User_name',
                      hintText: ' User name',
                      prefixIcon: Icon(Icons.person_3_rounded),
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
                
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Continue'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
