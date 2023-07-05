import 'package:expense_trucker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(expense.amount.toStringAsFixed(2)),
            const Spacer(),
            Column(
              children: [
                Text(expense.title),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    Text(
                      expense.date.toString(),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
