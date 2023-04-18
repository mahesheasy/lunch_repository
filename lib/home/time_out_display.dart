import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Container timeoutwidget(BuildContext context) {
  return Container(
    child: Text(
      "Time Out ⏳",
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 30,
            color: Color.fromARGB(255, 254, 3, 3),
          ),
    ),
  );
}
