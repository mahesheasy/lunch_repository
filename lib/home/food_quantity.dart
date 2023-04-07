import 'package:flutter/material.dart';
import 'package:lunch_app/home_page.dart';

List quantity = ['Total Lunch', r"Total Egg  "];

Row totalquantity(
    int quantityIndex, BuildContext context, String _totallunchandeggcount) {
  return Row(
    children: [
      Expanded(
        child: Text(quantity[quantityIndex],
            style: Theme.of(context).textTheme.displayLarge),
      ),
      SizedBox(
        width: 20,
        child: Text(":",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      Expanded(
        child: Text(_totallunchandeggcount,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.displayLarge),
      ),
    ],
  );
}
