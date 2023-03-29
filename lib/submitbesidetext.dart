import 'package:flutter/material.dart';

List submitbesidetextitems = ['Lock Cheyyala ? ', 'Lock Karna Kya ?'];

Text submitbesidetext(int submitbesidetextitemsIndex, BuildContext context) {
  return Text(submitbesidetextitems[submitbesidetextitemsIndex],
      style: Theme.of(context).textTheme.displayLarge);
}
