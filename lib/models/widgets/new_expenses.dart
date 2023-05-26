import 'package:flutter/material.dart';
import 'package:lunch_app/models/widgets/expenses_list/expense_data.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpenses});

  final void Function(Expense expense) onAddExpenses;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _SelectedDate;
  Category _SelectedCatagory = Category.food;

  void _saveExpensesData() {
    final enterdAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enterdAmount == null || enterdAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _SelectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid input'),
          content:
              const Text('please make sure with a valid title,amount,and date'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("okey"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpenses(
      Expense(
          title: _titleController.text,
          amount: enterdAmount,
          date: _SelectedDate!,
          category: _SelectedCatagory),
    );
    Navigator.pop(context);
  }

  void _presentDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _SelectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 100,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\₹ ',
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _SelectedDate == null
                          ? '00/00/202_'
                          : formatter.format(_SelectedDate!),
                    ),
                    IconButton(
                      onPressed: () {
                        _presentDate();
                        print("je;;");
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton<Category>(
                  value: _SelectedCatagory,
                  items: Category.values
                      .map(
                        (Category) => DropdownMenuItem(
                          value: Category,
                          child: Text(
                            Category.name.toLowerCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _SelectedCatagory = value;
                    });
                  }),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('cancel'),
              ),
              ElevatedButton(
                onPressed: _saveExpensesData,
                child: Text("save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
