import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

//Widget Class
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

//From build method we will return our widget tree
class _ExpensesState extends State<Expenses> {
  //This Contains the all expenses
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    //We can use built-in feature to open the overlay
    //This will add a UI model overlay when executed.

    //context--> contains related data to widgets
    //builder --> *Always a function that should return a widget*
    showModalBottomSheet(
      isScrollControlled: true, //Model overlay will take up full screen
      context: context,
      builder: (ctx) {
        return  NewExpense(onAddExpense: _addExpense); //Passes the function addExpense to the newExpense class
      },
    );
  }

  //Add new expense from model overlay to the final lsit
  void _addExpense(Expense expense){

    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),

        //actions[] ---> is List of widgets. Used to display buttons in tool bar top of screen
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
