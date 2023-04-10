import 'package:flutter/material.dart';
import 'package:lunch_app/home/date_time.dart';
import 'package:lunch_app/home/food_quantity.dart';

Container Totalquantatydisplay(
    BuildContext context, totallunchcount, totaleggcount) {
  return Container(
    width: 320,
    margin: EdgeInsets.only(
      top: 40,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total food quantity",
                style: Theme.of(context).textTheme.displayLarge),
            Row(
              children: [Current_Date(context)],
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        // totalquantity(0, context, totallunchcount.toString()),
        Quantitywidget(
            quantityIndex: 0,
            totallunchandeggcount: totallunchcount.toString()),
        SizedBox(
          height: 25,
        ),

        Quantitywidget(
            quantityIndex: 1, totallunchandeggcount: totaleggcount.toString()),
        //totalquantity(1, context, totaleggcount.toString())
      ],
    ),
  );
}
