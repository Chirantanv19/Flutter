import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

enum Typer { one, two, three, four }

const TyperSample = {
  Typer.one: Icons.abc_sharp,
  Typer.two: Icons.two_k,
  Typer.three: Icons.three_k_rounded,
  Typer.four: Icons.four_g_mobiledata,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class SampleOne {
  SampleOne({required this.name, required this.contact, required this.tyes})
    : id = uuid.v4();
  final String name;
  final String contact;
  final String id;
  final Typer tyes;
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  // uttilary
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
