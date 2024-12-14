
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//We style a expense objetct's widget and return it to expense list containing expense objects
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense; //This is the model for a expense. COntains title,Amount etc.
  @override
  Widget build(BuildContext context) {
    return Card(
      //Add padding- spaces between text and card borders.
      //Wrap the text widget with padding widget because card widget don't have padding option
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),

        //Need column to display widgets one by one down/above
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),

            //Need a row to represent widgets next to each other
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), //12.3433=> 12.34

                const Spacer(), //Spacer takes the maximum possible space between 2 widgets
                // So in here it takes maximum space between 'Text' & 'Row' Widget
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.getFormattedDate()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
