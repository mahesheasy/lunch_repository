
import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

Row adminbottombar(BuildContext context, totallunchcount, totaleggcount, meal_quantity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // we used "false , false" for balanceing buttons like copy and yes btns
      logoutsubmitSharebtn(
          1,
          context,
          false,
          false,
          totallunchcount.toString(),
          totaleggcount.toString(),
          meal_quantity),
      SizedBox(
        width: 20,
      ),
      Text(
        'and paste in WhatsApp',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 21, color: Colors.black),
      )
    ],
  );
}