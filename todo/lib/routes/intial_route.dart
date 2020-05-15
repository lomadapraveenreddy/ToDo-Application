import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/to_do_card.dart';
import '../to_do_bloc/to_do_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
          bloc: BlocProvider.of(context),
          builder: (BuildContext context, ToDoState state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ToDoCard(state.todoList[index]);
              },
              itemCount: state.todoList.length,
            );
          }),
    );
  }
}
