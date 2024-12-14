import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//We only output a expense list so, no need this to be a stateful class
//This simply gives a widget with decorations to a stateful class
class ExpensesList extends StatelessWidget {
  //This class accepts the list of expenses as a parameter
  //After that it modifies the UI with list values
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // .builder() ---> Tells to create a scrollable list but it should create items only when they are visible
    // It won't create 1000 items if list has 1000 items initially
    // It will create items that is only visible at the moment in the screen
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) { //This anonymous func will be getting called 'itemCount' number of times
        return Text(expenses[index].title);
      },
    );
  }
}
