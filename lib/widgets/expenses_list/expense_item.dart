import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//We style a expense objetct's widget and return it to expense list containing expense objects
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense; //This is the model for a expense. COntains title,Amount etc.
  @override
  Widget build(BuildContext context) {
    return Card(child: Text(expense.title),);
  }
}