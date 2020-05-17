import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';

import '../to_do_bloc/to_do_bloc.dart';
import 'package:intl/intl.dart';

//This Route helps us to add a to do.....
class NewToDo extends StatefulWidget {
  static String routeName = '/newToDo';

  @override
  _NewToDoState createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime _selectedDate;
  void addEventIfPossible() {
    String title = titleController.text;
    String description = descriptionController.text;
    if (title.isNotEmpty) {
      print('title not null');
      Navigator.of(context).pop();
      BlocProvider.of<ToDoBloc>(context).newToDo(ToDoModel(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        deadline: _selectedDate,
      ));
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 1)),
            firstDate: DateTime(2019),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Have Some Work?'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => addEventIfPossible(),
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: descriptionController,
              onSubmitted: (_) => addEventIfPossible(),
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _selectedDate == null
                      ? 'No date chosen'
                      : 'Date Chosen: ' +
                          DateFormat.yMMMd().format(_selectedDate),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: addEventIfPossible,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
