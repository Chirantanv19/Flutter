import 'dart:math';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Add amount',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(
                        color: const Color.fromARGB(233, 0, 0, 0),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _presentDataPicker();
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 118, 116, 116),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData();
                },
                child: const Text('Save Expense'),
              ),

              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // anna we are creating a controller which going to save the info anna and no need make sting sheet ra and remmnbare to desoposn anna.
  Category _selectedCategory = Category.leisure;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // var _enteredTitle = '';

  // void _saveTitleInput(String nameValue) {
  // _enteredTitle = nameValue;
  // }

  void _presentDataPicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year);
    final last = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: first,
      lastDate: last,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0
        ? true
        : false;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okey'),
            ),
          ],
        ),
      );
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);

    //   final List<Expense> _registeredExpenses = [
    //     Expense(
    //       title: _titleController.text,
    //       amount: enteredAmount,
    //       date: _selectedDate,
    //       category: _selectedCategory,
    //     ),
    //   ];

    //   ExpensesList(expenses: _registeredExpenses);
    //   Navigator.pop(context);
    // }
  }
}
