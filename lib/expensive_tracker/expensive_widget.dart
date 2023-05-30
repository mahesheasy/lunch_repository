import 'package:cloud_firestore/cloud_firestore.dart';
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
  final List<Expense> registeredExpense = [
    // Expense(
    //     Descriptions: " the foood",
    //     amount: 19.90,
    //     date: '00/00/202_',
    //     category: Category.food),
    // Expense(
    //     Descriptions: " the foood today",
    //     amount: 99.90,
    //     date: '00/00/202_',
    //     category: Category.egg),
  ];

  static var category;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onAddExpenses: _addExpenses,
      ),
    );
  }

  void _addExpenses(Expense expenses) {
    setState(() {
      registeredExpense.add(expenses);
    });
  }

  @override
  void initState() {
    readDataFromFirebase();
    super.initState();
  }

  Map<String, dynamic>? data;
  void readDataFromFirebase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('expenses').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          data = documentSnapshot.data() as Map<String, dynamic>?;
          print(data);
           Expense expense = Expense(
          Descriptions: data!['description'],
          amount: data!['amount'],
          date: data!['expensesDate'],
           category: nameToCategory(data!['category']),
        );
       
          registeredExpense.add(expense);
        
        }
        setState(() {
          
        });
      } else {
        print('No documents found.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

 

  void _removeExpenses(Expense expenses) {
    final ExpensesIndex = registeredExpense.indexOf(expenses);
    setState(() {
      registeredExpense.remove(expenses);
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
                    registeredExpense.insert(ExpensesIndex, expenses);
                  });
                  Navigator.pop(context);
                },
                child: Text("No", style: TextStyle(color: Colors.black)),
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
                  "Yes",
                  style: TextStyle(color: Colors.black),
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
    if (registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registeredExpense,
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
              // fortotalexpenses();
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
