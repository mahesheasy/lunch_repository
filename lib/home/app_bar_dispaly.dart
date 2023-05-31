import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    //Color.fromARGB(255, 222, 225, 225)
    backgroundColor: Colors.black87,
    leading: null,
    title: Row(
      children: [
        SizedBox(width: 20,),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Color.fromARGB(255, 240, 3, 3),
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.newRocker(fontSize: 0).fontFamily,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Meal",
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 241, 241),
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
  );
}
