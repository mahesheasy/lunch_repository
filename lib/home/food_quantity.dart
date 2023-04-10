import 'package:flutter/material.dart';

List quantity = ['Total Lunch', r"Total Egg  "];

// Row totalquantity(
//     int quantityIndex, BuildContext context, String _totallunchandeggcount) {
//   return Quantitywidget();
// }

class Quantitywidget extends StatelessWidget {
  const Quantitywidget({
    super.key,
    required this.quantityIndex,
    required this.totallunchandeggcount,
  });

  final int quantityIndex;
  final String totallunchandeggcount;

  @override
  Widget build(BuildContext context) {
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
          child: Text(totallunchandeggcount,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.displayLarge),
        ),
      ],
    );
  }
}
