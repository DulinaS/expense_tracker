import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate; //variable hasn't been initialized

  //Initial category default value before selecting
  Category _selecedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month,
        now.day); //firstDate is a one year behind today year

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate:firstDate, //Oldest date can be set because this is a expense tracker
      lastDate: now, //Today's date --> You can;t add future expenses
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ', //Dollar Sign front of amount
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, //Set widget at end of screen
                  crossAxisAlignment:
                      CrossAxisAlignment.center, //Center content vertically
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16), //Distance between row of buttons and textFields
          //Row for buttons
          Row(
            children: [
              DropdownButton(
                value:_selecedCategory, //Initial text on dropdown button shows default selected category
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return; //No category is selected
                  }
                  setState(() {
                    _selecedCategory =
                        value; //Screen gets updated with Newly selected category-->
                    //That is why setState() is used to update UI
                  });
                },
              ),
              const Spacer(), //maxmimum distance between 2 widgets
              TextButton(
                onPressed: () {
                  Navigator.pop(context); //Removes overlay from screen
                },
                child: const Text('Cancel'),
              ),
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
