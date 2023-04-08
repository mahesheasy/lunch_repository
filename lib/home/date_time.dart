import 'package:flutter/material.dart';

var now = DateTime.now();

Row Current_Date(BuildContext context) {
  if (now.hour >= 10 && now.minute > 30) {}

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${now.day}-${now.month}-${now.year}',
          style: Theme.of(context).textTheme.displayLarge),
    ],
  );
}

// we have to do one thing in next virsion that is 
// -------
// 1 . we have to wrap with Column to Row and and one Row above present 
//Row and use text weigates for labeling "Present Time " and "Present Day "  
