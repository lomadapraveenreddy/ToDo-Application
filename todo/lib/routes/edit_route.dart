import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';
import '../bloc/to_do_list_bloc/to_do_list_bloc.dart';

class EditRoute extends StatefulWidget {
  static final routeName = '/EditToDo';
  final ToDoModel object;
  
  EditRoute(this.object);

  @override
  _EditRouteState createState() => _EditRouteState();
}

class _EditRouteState extends State<EditRoute> {
  int flag=0;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime _selectedDate;
  void _editFunction() {
    print('edit func');
    String title = titleController.text;
    String description = descriptionController.text;
    if (title != null && _selectedDate != null) {
      BlocProvider.of<ToDoListBloc>(context)
          .editToDo(widget.object.id, title, description, _selectedDate);
      Navigator.of(context).pop();
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
    if (flag == 0) {
      _selectedDate = widget.object.deadline;
      titleController.text = widget.object.title;
      descriptionController.text = widget.object.description;
      flag = 1;
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,

              //initialValue: widget.object.title,
            ),
            TextFormField(
              controller: descriptionController,
              //initialValue: widget.object.description,
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
                onPressed: _editFunction,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
