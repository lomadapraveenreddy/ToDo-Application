import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/routes/all_routes.dart';
import '../widgets/my_fab.dart';

import '../bloc/to_do_bloc/to_do_bloc.dart';
import '../models/todo.dart';

class DetailRoute extends StatelessWidget {
  static final routeName = '/DetailView';
  final String id;
  DetailRoute(this.id);
  Widget _buildDivider() {
    return Divider(
      color: Colors.black45,
    );
  }

  Widget _buildItem(title, text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: <Widget>[
        // SizedBox(
        //   height: 10,
        // ),
        _buildDivider(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
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
              text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        _buildDivider(),
      ]),
    );
  }

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
              child: Column(children: <Widget>[
                _buildItem('Title:', object.title),
                if (object.description.isNotEmpty)
                  _buildItem('Description:', object.description),
                   Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   Text(
                     'Created on...  ' +
                         DateFormat.yMMMd()
                             .format(DateTime.parse(object.id)),
                     style: TextStyle(
                       fontSize: 16,
                     ),
                   ),
                   Text(
                     'Finish this before...' +
                         DateFormat.yMMMd().format(object.deadline),
                     style: TextStyle(
                       fontSize: 16,
                     ),
                     ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                EditRoute.routeName,
                                arguments: object,
                              );
                            },
                            child: MyFAB(Icons.edit)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
