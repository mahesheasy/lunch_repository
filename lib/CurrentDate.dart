import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Row currentDate() {
  return Row(
    // mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.end,

    children: [
      Text(
        '25 - 03 - 2023',
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
