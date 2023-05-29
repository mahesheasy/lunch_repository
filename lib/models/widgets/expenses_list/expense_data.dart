import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
final formatter=DateFormat.yMd() ;
final uuid = Uuid();


enum Category { food, egg, extra }
 const CategoryIcon ={
  Category.food :Icons.lunch_dining_rounded,
  Category.egg :Icons.egg_rounded,
  Category.extra :Icons.dining,
 };

class Expense {
  final String id;
  final String Descriptions;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }

  Expense(
      {required this.Descriptions,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
}
