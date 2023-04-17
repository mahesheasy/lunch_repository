import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

Row yesbtnandtext(
    int buttonNamesIndex,
    BuildContext context,
    bool _lunchisChecked,
    bool _eggisChecked,
    totallunchcount,
    totaleggcount,
    listtext,
    {VoidCallback? onPress}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        listtext,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 28,
              color: Colors.white,
            ),
      ),
      SizedBox(
        width: 10,
      ),
      logoutsubmitSharebtn(
        0,
        context,
        _lunchisChecked,
        _eggisChecked,
        null,
        null,
        onPress: () {
          onPress?.call();
        },
      ),
    ],
  );
}
