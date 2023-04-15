import 'package:flutter/material.dart';

class CheckBoxtile extends StatelessWidget {
  final bool initialvalue;
  final bool isLunchProvided;
  final void Function(bool? value) onchnage;
  final String title;

  const CheckBoxtile(
      {super.key,
      required this.initialvalue,
      required this.onchnage,
      required this.isLunchProvided,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: CheckboxListTile(
        value: initialvalue,
        enabled: isLunchProvided,
        onChanged: onchnage,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 25,
                color: Colors.grey[800],
              ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
