import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  work,
  travel,
  leisure,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final Category category;
  final double amount;
  final DateTime date;
}
