import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

import 'package:lunch_app/models/widgets/expenses_list/expense_data.dart';
import 'package:lunch_app/models/widgets/expenses_list/expenses_list.dart';
import 'package:lunch_app/models/widgets/new_expenses.dart';

class ExpensiveWidget extends StatefulWidget {
  const ExpensiveWidget({super.key});

  @override
  State<ExpensiveWidget> createState() => _ExpensiveWidgetState();
}

class _ExpensiveWidgetState extends State<ExpensiveWidget> {
  final List<Expense> registeredExpense = [];
    bool _isLoading = false;

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
    _isLoading=true;
    super.initState();
  }

  Map<String, dynamic>? data;
  void readDataFromFirebase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('expenses_${now.month}-${now.year}')
          .orderBy('expensesDate')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          data = documentSnapshot.data() as Map<String, dynamic>?;
          Expense expense = Expense(
            Descriptions: data!['description'],
            amount: data!['amount'],
            date: data!['expensesDate'],
            category: nameToCategory(data!['category']),
            id: documentSnapshot.id,
          );

          registeredExpense.add(expense);
        }
        setState(() {
          _isLoading=false;
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

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Are you sure?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                  FirebaseFirestore firestore = FirebaseFirestore.instance;

                  print(expenses.id);
                  firestore
                      .collection('expenses')
                      .doc(expenses.id)
                      .delete()
                      .then((value) {
                    setState(() {
                      registeredExpense.remove(expenses);
                      
                    });
                  }).catchError((error) {
                    print("Failed to delete document: $error");
                  });
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
      body:_isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
