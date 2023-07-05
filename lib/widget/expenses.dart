import 'package:expense_trucker/models/expense.dart';
import 'package:expense_trucker/widget/expenses_list.dart';
import 'package:expense_trucker/widget/new_expensive.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: "Flutter course",
      amount: 19.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Buying a car",
      amount: 20,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _showModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpensive(addExpensive),
    );
  }

  void addExpensive(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void removeExpensive(Expense expense) {
    int index = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expensive Trucker"),
        actions: [
          IconButton(
            onPressed: _showModalSheet,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Chart"),
            Expanded(
              child: ExpenseList(
                  expenses: _expenses, removeExpensive: removeExpensive),
            ),
          ],
        ),
      ),
    );
  }
}
