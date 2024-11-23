import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section7/core/mobile_info.dart';
import 'package:section7/widgets/chart/chart.dart';
import 'package:section7/widgets/expenses_list/expenses_list.dart';
import 'package:section7/models/expense.dart';
import 'package:section7/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.WORK,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.LEISURE,
    ),
    Expense(
      title: 'Dinner',
      amount: 80.0,
      date: DateTime.now(),
      category: Category.FOOD,
    ),
    Expense(
      title: 'Goa',
      amount: 20000,
      date: DateTime.now(),
      category: Category.TRAVEL,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,//stay away from device features like camera
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addExpanse),
    );
  }

  void _addExpanse(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpanse(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: Text('Expense deleted.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // MobileInfo(context).mobileScreenInfo;

    double width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No expenses found. Start adding some!',
        style: GoogleFonts.lato(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpansesList(
        expanses: _registeredExpenses,
        onRemoveExpense: _removeExpanse,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                const Text('The chart'),
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

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
