import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/routes/all_routes.dart';
import '../bloc/to_do_bloc/to_do_bloc.dart';

class MyDrawer extends StatelessWidget {
  List<Widget> drawerItemWidgets(context) {
    return drawerItems.map((item) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<ToDoBloc>(context).add(item['action']);
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
              Expanded(
                child: Text(
                  item['text'],
                  style: TextStyle(fontSize: 20),
                ),
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
      'icon': Icon(Icons.done_all),
      'text': 'All',
      'bloc': ToDoBloc,
    },
    {
      'action': ShowAllEvent(),
      'icon': Icon(Icons.star),
      'text': 'Favourites',
      'bloc': ToDoBloc,
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
          height: 230,
          color: Theme.of(context).primaryColor,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'ToDo List',
                style: TextStyle(
                    fontSize: 40, color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ),
        ...drawerItemWidgets(context),
        Expanded(child: SizedBox()),
        GestureDetector(
          child: Text('About This App'),
          onTap: () {
            Navigator.of(context).pushNamed(AboutRoute.routeName);
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
