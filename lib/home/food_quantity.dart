import 'package:flutter/material.dart';

List quantity = ['Total Lunch', r"Total Egg  "];

Row totalquantity(
    int quantityIndex, BuildContext context, String _totallunchandeggcount) {
  return Row(
    // crossAxisAlignment: CrossAxisAlignment.baseline,
    //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
