import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_page();
}

class _Login_page extends State<Login_page> {
  final TextEditingController _editingController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    ToastContext().init(context);
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://media.tenor.com/8vB6Rw4l4I8AAAAC/bubududu-food.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://easycloud.in/wp-content/uploads/2018/06/logo_final.png',
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _editingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: ' emailAddress',
                            hintText: 'emailAddress',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _passwordController,
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
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            // print("user enterd :${_editingController.text}");
                            // print(
                            //     "user enterd the password:${_passwordController.text}");
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _editingController.text,
                                password: _passwordController.text,
                              );
                              var user = credential.user;
                              print(user);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              Toast.show("invalid email or password",
                                  duration: Toast.lengthLong,
                                  gravity: Toast.top);
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              Toast.show("invalid email or password",
                                  duration: Toast.lengthLong,
                                  gravity: Toast.top);

                              print(e);
                              print("password error");
                            }
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'email',
                                _editingController
                                    .text); //it is used to save the email and password entered by the user
                            prefs.setString(
                                'password', _passwordController.text);
                          },
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
