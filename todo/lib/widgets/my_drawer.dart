import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../to_do_list_bloc/to_do_list_bloc.dart';

class MyDrawer extends StatelessWidget {
  List<Widget> drawerItemWidgets(context) {
    return drawerItems.map((item) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<ToDoListBloc>(context).add(item['action']);
          Navigator.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 40,
              ),
              item['icon'],
              SizedBox(
                width: 40,
              ),
              Text(
                item['text'],
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  final drawerItems = [
    {
      'action': ShowAllEvent(),
      'icon': Icon(Icons.work),
      'text': 'All',
    },
    {
      'action': ShowActiveEvent(),
      'icon': Icon(Icons.work),
      'text': 'Active',
    },
    {
      'action': ShowCompletedEvent(),
      'icon': Icon(Icons.done),
      'text': 'Completed',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 300,
          color: Theme.of(context).primaryColor,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'ToDo List',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
        ),
        ...drawerItemWidgets(context),
      ],
    ));
  }
}
