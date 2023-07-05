import 'package:expense_trucker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text('\$ ${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Column(
              children: [
                Text(expense.title),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(expense.icon),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expense.dateFormat,
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
