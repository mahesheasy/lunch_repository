import 'package:lunch_app/home/home_page.dart';
import 'package:lunch_app/login/text_fields/email_input.dart';
import 'package:lunch_app/login/text_fields/password_input.dart';

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
  TextEditingController _editingController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  void passwordVisibility() {
    setState(
      () {
        _passwordVisible = !_passwordVisible;
      },
    );
  }

  @override
  void initState() {
    ToastContext().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      // appBar: PreferredSize(
      //   child: AppBar(
      //     backgroundColor: Color.fromARGB(236, 9, 0, 0),
      //     actions: const [
      //       IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.food_bank_rounded,
      //           color: Colors.white,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.lunch_dining,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         // Text(" MealMaven"),
      //         RichText(
      //           text: TextSpan(
      //             style: TextStyle(
      //               color: Color.fromARGB(255, 240, 3, 3),
      //               fontSize: 28,
      //               fontWeight: FontWeight.w900,
      //               fontFamily: GoogleFonts.newRocker(fontSize: 0).fontFamily,
      //             ),
      //             children: <TextSpan>[
      //               TextSpan(
      //                 text: "Meal",
      //                 style: TextStyle(
      //                   color: Color.fromARGB(255, 255, 255, 255),
      //                 ),
      //               ),
      //               TextSpan(
      //                 text: " Maven",
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   preferredSize: Size.fromHeight(65),
      // ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 70,
          left: 16,
          right: 16,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.s,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color.fromARGB(255, 240, 3, 3),
                    fontSize: 43,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.newRocker(fontSize: 0).fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Meal",
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 0, 0),
                      ),
                    ),
                    TextSpan(
                      text: " Maven",
                    ),
                  ],
                ),
              ),
            ),
            Image.network(
              'https://media.tenor.com/8vB6Rw4l4I8AAAAC/bubududu-food.gif',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 20,
            ),
            Email_input(_editingController),
            SizedBox(
              height: 18,
            ),
            Password_input(
              _passwordVisible,
              _passwordController,
              context,
              onPress: () {
                passwordVisibility();
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
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
                  EdgeInsets.all(16),
                ),
                minimumSize: MaterialStatePropertyAll(
                  Size(40, 40),
                ),
              ),
              onPressed: () async {
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _editingController.text,
                    password: _passwordController.text,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  Toast.show("invalid email or password",
                      duration: Toast.lengthLong, gravity: Toast.top);
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  Toast.show("invalid email or password",
                      duration: Toast.lengthLong, gravity: Toast.top);

                  print(e);
                  print("password error");
                }
              
               
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Color.fromARGB(221, 1, 1, 1), // text color
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "forgot password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text("Don't have an account? SIGN UP")),
          ],
        ),
      ),
    );
  }
}
