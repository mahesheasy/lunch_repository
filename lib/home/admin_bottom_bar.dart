
import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

Row adminbottombar(BuildContext context, totallunchcount, totaleggcount, meal_quantity,{VoidCallback? onPress}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // we used "false , false" for balanceing buttons like copy and yes btns
      logoutsubmitSharebtn(
          1,
          context,
          false,
          false,
          totallunchcount.toString(),
          totaleggcount.toString(),
          meal_quantity
         ),
     
 logoutsubmitSharebtn(
        2,
        context,
        false,
        false,
        null,
        null,
        meal_quantity,
        onPress: () {
          onPress?.call();
          
        },
      ),
     
    ],
  );
}