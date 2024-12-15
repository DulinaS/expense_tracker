import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

//We only output a expense list so, no need this to be a stateful class
//This simply gives a widget with decorations to a stateful class
class ExpensesList extends StatelessWidget {
  //This class accepts the list of expenses as a parameter
  //After that it modifies the UI with list values
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // .builder() ---> Tells to create a scrollable list but it should create items only when they are visible
    // It won't create 1000 items if list has 1000 items initially
    // It will create items that is only visible at the moment in the screen
    return ListView.builder(
      itemCount: expenses.length,
      /* itemBuilder: (ctx, index) { //This anonymous func will be getting called 'itemCount' number of times
        return ExpenseItem(expenses[index]);
      }, */
      //key - make Widgets uniquely identifiable
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75), //Color when swipping
          //margin: const EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal), //Starts same as the CARD widget margin. we already put in main class CARD theme
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          //Regardless the direction we swipe
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
