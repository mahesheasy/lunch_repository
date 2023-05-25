import 'package:flutter/material.dart';

import 'package:lunch_app/models/widgets/expenses_list/expense_data.dart';
import 'package:lunch_app/models/widgets/expenses_list/expenses_list.dart';
import 'package:lunch_app/models/widgets/new_expenses.dart';

class ExpensiveWidget extends StatefulWidget {
  const ExpensiveWidget({super.key});

  @override
  State<ExpensiveWidget> createState() => _ExpensiveWidgetState();
}

class _ExpensiveWidgetState extends State<ExpensiveWidget> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: " the foood",
        amount: 19.90,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: " the foood today",
        amount: 99.90,
        date: DateTime.now(),
        category: Category.egg),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('the chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
