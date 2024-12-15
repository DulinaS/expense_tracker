
import 'package:expense_tracker/widgets/chart/chart.dart';
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
        return NewExpense(
            onAddExpense:
                _addExpense); //Passes the function addExpense to the newExpense class
      },
    );
  }

  //Add new expense from model overlay to the final lsit
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  //remove expense when dissmissing
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense); //Position of the expense object in the list
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //Removes already sncakbars(labekl with undo) immediatly
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense); //Insert the deleted expense exactly at the same position to the list again
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start Adding Some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
          Chart(expenses : _registeredExpenses), //Gives all expenses list
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
