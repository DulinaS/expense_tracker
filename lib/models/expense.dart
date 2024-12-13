//DATA STRUCTURE/Bleuprint for a expense. Just like quiz_question.dart in quiz_app
//We will generate unique id
import 'package:uuid/uuid.dart';

const uuid = Uuid(); //Used to generate unique IDs- Utility Object

enum Category { food , travel , leisure , work}

class Expense {
  Expense({
    required this.title,   //We have used named parameters because using positional
    
    required this.amount,  //Parameters, we need provide them in the same order that we have put method(int,int,String)
    
    required this.date,     // we have to provide data in same order int,int,String. So named parameters are easier
    
    required this.category, //There can be multiple expense types
    
    }) : id = uuid.v4() ;  //Generates unique id and assign to 'id' whenever this 'Expense' class is initiated.    

  final String id;
  final String title;
  final double amount;
  final DateTime date; //built-in dart feature to store date
  final Category category;
}

