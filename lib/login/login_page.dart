import 'package:lunch_app/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color.fromARGB(236, 9, 0, 0),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.food_bank_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.lunch_dining,
                color: Colors.white,
              ),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(" MealMaven"),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color.fromARGB(255, 240, 3, 3),
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.newRocker(fontSize: 0).fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Meal",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    TextSpan(
                      text: " Maven",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(65),
      ),
      body: Container(
        decoration: BoxDecoration(

            //color: Colors.black,
            // image: DecorationImage(
            //   // image: NetworkImage(
            //   //     'https://media.tenor.com/8vB6Rw4l4I8AAAAC/bubududu-food.gif'),
            //   // fit: BoxFit.cover,
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://media.tenor.com/8vB6Rw4l4I8AAAAC/bubududu-food.gif',
                    height: 200,
                    fit: BoxFit.cover,
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
                            labelText: ' Email address',
                            labelStyle: GoogleFonts.kaushanScript(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black),
                            hintText: 'Enter your email address',
                            hintStyle: GoogleFonts.greatVibes(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black),
                            fillColor: Color.fromARGB(255, 222, 224, 225),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person_3_rounded,
                              color: Color.fromARGB(255, 3, 3, 3),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                gapPadding: 5),
                          ),
                          cursorColor: Colors.red,
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
                           obscureText: true,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                          decoration: InputDecoration(
                            labelText: ' Password ',
                            
                            labelStyle: GoogleFonts.kaushanScript(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black),
                            hintText: 'Enter your password:',
                            hintStyle: GoogleFonts.greatVibes(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black),
                            fillColor: Color.fromARGB(255, 222, 224, 225),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.password_sharp,
                              color: Color.fromARGB(255, 10, 9, 9),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                gapPadding: 5),
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
                          style: ButtonStyle(
                            textStyle: MaterialStatePropertyAll(
                              GoogleFonts.vastShadow(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 1, 1),
                              ),
                            ),
                            elevation: MaterialStatePropertyAll(4),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 200, 192, 234),
                            ),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.all(8),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(40, 40),
                            ),
                          ),
                          onPressed: () async {
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
                            prefs.setString('email', _editingController.text);
                            prefs.setString(
                                'password', _passwordController.text);
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Color.fromARGB(221, 1, 1, 1), // text color
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "forgot password",
                    ),
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
