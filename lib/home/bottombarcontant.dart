import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunch_app/home/admin_bottom_bar.dart';
import 'package:lunch_app/home/home_page_buttons.dart';
import 'package:lunch_app/home/user_bottom_bar.dart';

Widget Bottomappbarcontant(BuildContext context, totallunchcount, totaleggcount,
    meal_quantity, isLunchProvided,fixedTime) {
  final user = FirebaseAuth.instance.currentUser;
  if (now.hour >= fixedTime && user?.email == "lunch123@gmail.com") {
    return adminbottombar(context, totallunchcount, totaleggcount, meal_quantity);
  }
   else if (now.hour < fixedTime ) {
   // return userbottombar(context,"You have to update the food");
    if (isLunchProvided) {
      return userbottombar(context,"successfully Updated");
      
    } else {
      return userbottombar(context,"you have to update the food");
    }
  } else if (now.hour >= fixedTime ) {
    if (isLunchProvided) {
      return userbottombar(context,"successfully Updated");
      
    } else {
      return userbottombar(context,"you missed the lunch");
    }
  }
 else{
    return SizedBox();
  }
}


