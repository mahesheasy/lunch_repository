import 'package:flutter/material.dart';

Container timeoutwidget(BuildContext context) {
  return Container(
    child: Text(
      "Time Out",
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 40,
            color: Colors.white,
          ),
    ),
  );
}
