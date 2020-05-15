import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './route_generator.dart';
import './bloc/to_do_list_bloc/to_do_list_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToDoListBloc>(create:(_)=>ToDoListBloc(),),
        //BlocProvider<ToDoBloc>(create:(_)=>ToDoBloc(),),
      ],
       
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
