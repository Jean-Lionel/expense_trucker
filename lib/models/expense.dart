import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

var format = DateFormat.yMd();

enum Category {
  food,
  work,
  travel,
  leisure,
}

const iconCategories = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.flight_land_rounded,
  Category.leisure: Icons.live_help,
};

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

  String get dateFormat {
    return format.format(date);
  }

  IconData? get icon {
    return iconCategories[category];
  }
}
