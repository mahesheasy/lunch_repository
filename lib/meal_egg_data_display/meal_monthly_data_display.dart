import 'package:flutter/material.dart';

class Meal_monthly_data_display extends StatefulWidget {
  const Meal_monthly_data_display({super.key});

  @override
  State<Meal_monthly_data_display> createState() =>
      _Meal_monthly_data_displayState();
}

class _Meal_monthly_data_displayState extends State<Meal_monthly_data_display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count'),
      ),
      body: Center(
        child: Column(
          children: [
// basic card
            Card(
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
