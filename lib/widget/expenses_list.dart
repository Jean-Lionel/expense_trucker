import 'package:expense_trucker/models/expense.dart';
import 'package:expense_trucker/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpensive,
  });

  final List<Expense> expenses;
  final Function(Expense expense) removeExpensive;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expensive Available"),
    );

    if (expenses.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.70),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              removeExpensive(expenses[index]);
            },
            child: ExpenseItem(
              expenses[index],
            )),
      );
    }

    return mainContent;
  }
}
