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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddExpenses: _addExpenses),
    );
  }

  void _addExpenses(Expense expenses) {
    setState(() {
      _registeredExpense.add(expenses);
    });
  }

  void _removeExpenses(Expense expenses) {
    final ExpensesIndex = _registeredExpense.indexOf(expenses);
    setState(() {
      _registeredExpense.remove(expenses);
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?",
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('Do you want to remove'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 49, 120, 35),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _registeredExpense.insert(ExpensesIndex, expenses);
                  });
                  Navigator.pop(context);
                },
                child: Text("No",style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 209, 13, 13),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Yes",style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        Center(child: Text("No expenses found..try to add Some !"));
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        onRemoveExpenses: _removeExpenses,
      );
    }
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
