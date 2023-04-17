import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

Row Bottomappbarcontant(
  BuildContext context,
  totallunchcount,
  totaleggcount,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      logoutsubmitSharebtn(1, context, false, true, totallunchcount.toString(),
          totaleggcount.toString()),
      SizedBox(
        width: 20,
      ),
      Text(
        'and paste in WhatsApp',
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 21, color: Colors.black),
      )
    ],
  );
}
