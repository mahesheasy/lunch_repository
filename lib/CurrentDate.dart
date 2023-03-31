import 'package:flutter/material.dart';

var now = DateTime.now();

Row currentDate() {
  return Row(
    // mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
      Text('${now.hour}hour\'s-${now.minute}min\'s-${now.second}sec\'s',
          style: TextStyle(color: Colors.white)),
      Text('${now.day}-${now.month}-${now.year}',
          style: TextStyle(color: Colors.white)),
    ],
  );
}

// we have to do one thing in next virsion that is 
// -------
// 1 . we have to wrap with Column to Row and and one Row above present 
//Row and use text weigates for labeling "Present Time " and "Present Day "  
