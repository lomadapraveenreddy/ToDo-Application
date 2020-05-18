import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/models/todo.dart';

import '../bloc/to_do_bloc/to_do_bloc.dart';
import 'package:intl/intl.dart';

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
    if (title.isNotEmpty &&
        _selectedDate.difference(DateTime.now()).inDays >= 0) {
      Navigator.of(context).pop();
      BlocProvider.of<ToDoBloc>(context).newToDo(
        ToDoModel(
          id: DateTime.now().toString(),
          title: title,
          description: description,
          deadline: _selectedDate,
        ),
      );
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 1)),
            firstDate: DateTime.now(),
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
              key: Key('TitleKey'),
              controller: titleController,
              onSubmitted: (_) => addEventIfPossible(),
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              key: Key('DescriptionKey'),
              controller: descriptionController,
              onSubmitted: (_) => addEventIfPossible(),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
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
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      key: Key('ChooseDate'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
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
                color: Theme.of(context).primaryColor,
                onPressed: addEventIfPossible,
                child: Text('Submit',
                key: Key('SubmitButton'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
