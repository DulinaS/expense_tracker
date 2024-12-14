import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //Store inputs--> TextEditingController() is a object
  //            --> Handles USER inputs automatically by Flutter
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  //You have to CLOSE the 'TextEditingController()' when the overlay is closed
  //Otherwise 'TextEditingControlle(); will stay live.

  @override
  void dispose() {
    _titleController
        .dispose(); //Only State classes can use dipose() method that's why this class should be a STATEFUL WIDGET
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Don't want widgets to the edge of the screen
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50, //Number of characters that can be inputted
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
