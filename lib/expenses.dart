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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The Chart'),
          Text('Expenses list'),
        ],
      ),
    );
  }
}
 