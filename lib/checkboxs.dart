import 'package:flutter/material.dart';

List items = ['Lunch', 'Egg'];

CheckboxListTile checkbox(int itemIndex) {
  return CheckboxListTile(
    value: false,
    onChanged: null,
    title: Text(items[itemIndex]),
    controlAffinity: ListTileControlAffinity.leading,
  );
}
