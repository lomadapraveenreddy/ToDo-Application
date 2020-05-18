import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/to_do_bloc/to_do_bloc.dart';
import '../bloc/theme_bloc/theme_bloc.dart';

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
                style: TextStyle(fontSize: 40, color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ),
        ...drawerItemWidgets(context),
        GestureDetector(
        onTap: () {
           Navigator.of(context).pop();
          BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 40,
              ),
              //Icon(Icons.check_box_outline_blank),
              Icon(Icons.color_lens),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: BlocBuilder<ThemeBloc,ThemeState>(builder: (context,state){
                      return Text(
                   state.themetype==0?'Light Theme':'Dark Theme',
                  style: TextStyle(fontSize: 20),
                );
                })
                
              ),
            ],
          ),
        ),
      )
      ],
    ));
  }
}
