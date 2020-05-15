import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/all_routes.dart';
import '../widgets/to_do_card.dart';
import '../bloc/to_do_list_bloc/to_do_list_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  NewToDo.routeName,
                );
              }),
        ],
      ),
      body: BlocBuilder<ToDoListBloc, ToDoListState>(
          bloc: BlocProvider.of(context),
          builder: (BuildContext context, ToDoListState state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ToDoCard(state.todoList[index]);
              },
              itemCount: state.todoList.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(
          NewToDo.routeName,
        ),
      ),
    );
  }
}
