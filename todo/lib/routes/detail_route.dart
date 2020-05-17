import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/routes/all_routes.dart';

import '../to_do_bloc/to_do_bloc.dart';
import '../models/todo.dart';

class DetailRoute extends StatelessWidget {
  static final routeName = '/DetailView';
  final String id;
  DetailRoute(this.id);

  @override
  Widget build(BuildContext context) {
    
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
                  BlocProvider.of<ToDoBloc>(context).deleteToDo(id);
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
      bloc: BlocProvider.of<ToDoBloc>(context),
      builder: (context, state) {
        ToDoModel object = BlocProvider.of<ToDoBloc>(context).getByID(id);
        print('bloc builder detail');
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(object.title),
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
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        object.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  
                  object.description.isNotEmpty
                      ? Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.black45,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Description',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    object.description,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  if (object.deadline != null)
                    Text(DateFormat.yMMMd().format(object.deadline)),
                  Flexible(
                    flex: 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        child: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            EditRoute.routeName,
                            arguments: object,
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
