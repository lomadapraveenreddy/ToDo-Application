import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/routes/all_routes.dart';

import '../bloc/to_do_list_bloc/to_do_list_bloc.dart';
import '../models/todo.dart';

class DetailRoute extends StatelessWidget {
  static final routeName = '/DetailView';
  final String id;
  DetailRoute(this.id);

  @override
  Widget build(BuildContext context) {
    ToDoModel toDoObject = BlocProvider.of<ToDoListBloc>(context).getByID(id);
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Confirm Deletion"),
            content: new Text("Are You Sure?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Delete"),
                onPressed: () {
                  BlocProvider.of<ToDoListBloc>(context).deleteToDo(id);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return BlocBuilder(
      bloc: BlocProvider.of<ToDoListBloc>(context),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(toDoObject.title),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.delete), onPressed: _showDialog),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: <Widget>[
                  Text(toDoObject.title),
                  Text(toDoObject.description),
                  Text(DateFormat.yMMMd().format(toDoObject.deadline)),
                  Flexible(
                    flex: 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        child: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            EditRoute.routeName,
                            arguments: toDoObject,
                          );
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
