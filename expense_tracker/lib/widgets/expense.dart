import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),

    Expense(
      title: 'Cinema',
      amount: 14.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _oopenAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpenses(onAddExpense: _addExpense);
      },
    );
  }

  final List<SampleOne> _newList = [
    SampleOne(name: 'name', contact: '7709071960', tyes: Typer.three),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpanse(Expense expence) {
    final expenseIndex = _registeredExpenses.indexOf(expence);
    setState(() {
      _registeredExpenses.remove(expence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expence);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;

    Widget mainContent = Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removerFunction: _removeExpanse,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        // backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            onPressed: () {
              _oopenAddExpenseOverlay();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
