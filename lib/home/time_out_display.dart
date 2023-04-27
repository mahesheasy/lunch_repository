import 'package:flutter/material.dart';


Container timeoutwidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 6),
    child: Text(
      "Time Out ⏳",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 28,
            color: Color.fromARGB(255, 254, 3, 3),
          ),
    ),
  );
}
