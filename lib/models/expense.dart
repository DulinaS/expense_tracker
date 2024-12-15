//DATA STRUCTURE/Bleuprint for a expense. Just like quiz_question.dart in quiz_app
//We will generate unique id
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart'; //to Format the date

final formatter = DateFormat.yMd();

const uuid = Uuid(); //Used to generate unique IDs- Utility Object

enum Category { food, travel, leisure, work }

//Icons for each category based on category types
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title, //We have used named parameters because using positional

    required this.amount, //Parameters, we need provide them in the same order that we have put method(int,int,String)

    required this.date, // we have to provide data in same order int,int,String. So named parameters are easier

    required this.category, //There can be multiple expense types
  }) : id = uuid
            .v4(); //Generates unique id and assign to 'id' whenever this 'Expense' class is initiated.

  final String id;
  final String title;
  final double amount;
  final DateTime date; //built-in dart feature to store date
  final Category category;

  //This is a getter to format the date---> For that we can import 3rd party package intl to format it
  String getFormattedDate() {
    return formatter.format(date);
  }
}

//Class to build the chart because we need sum of each category expenses
class ExpenseBucket {
  //Default constructor
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  //Additional Constructor for the class to filter out the ones belong to a category
  //Filters expenses belong to specific category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  //getter is same as a function but one that doesn't accept arguments
  //Returns total sum of the expenses
  double get totalExpenses {
    double sum = 0;

    //Goes every elements in expenses list
    for (final expense in expenses) {
      sum += expense.amount; //sum = sum + expense.amount
    }

    return sum;
  }
}
