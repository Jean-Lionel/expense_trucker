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
      context: context,
      builder: (ctx) => const NewExpensive(),
    );
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
              child: ExpenseList(expenses: _expenses),
            ),
          ],
        ),
      ),
    );
  }
}
