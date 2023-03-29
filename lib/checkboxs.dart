import 'package:flutter/material.dart';

List items = ['Lunch', 'Egg'];

CheckboxListTile checkbox(int itemIndex, BuildContext context) {
  return CheckboxListTile(
    value: false,
    onChanged: null,
    title: Text(
      items[itemIndex],
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 23, color: Colors.grey[800]),
    ),
    controlAffinity: ListTileControlAffinity.leading,
  );
}
