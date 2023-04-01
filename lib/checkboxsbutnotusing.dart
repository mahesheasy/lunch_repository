// import 'package:flutter/material.dart';

// List items = ['Lunch', 'Egg'];
// bool _lunchisChecked = false;
// bool _eggisChecked = false;
// CheckboxListTile checkbox(int itemIndex, BuildContext context) {
//   return 
//   Container(
//     child: Column(
//       children: [
//         CheckboxListTile(
//           value: _lunchisChecked,
//           onChanged: (newValue) async {
//             assert(newValue != null);
//             setState(() {
//               _lunchisChecked = newValue!;
//             });
//           },
//           title: Text(
//             "Lunch",
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyLarge!
//                 .copyWith(fontSize: 23, color: Colors.grey[800]),
//           ),
//           controlAffinity: ListTileControlAffinity.leading,
//         ),  CheckboxListTile(
//           value: _eggisChecked,
//           onChanged: (newValue) async {
//             assert(newValue != null);
//             setState(() {
//               _eggisChecked = newValue!;
//             });
//           },
//           title: Text(
//             "Egg",
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyLarge!
//                 .copyWith(fontSize: 23, color: Colors.grey[800]),
//           ),
//           controlAffinity: ListTileControlAffinity.leading,
//         ),
//       ],
//     ),
//   );
// }
