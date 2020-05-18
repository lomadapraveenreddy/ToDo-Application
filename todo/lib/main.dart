import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';


import './bloc/theme_bloc/theme_bloc.dart';
import './bloc/to_do_bloc/to_do_bloc.dart';
import './route_generator.dart';
import './models/todo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox('todoBox');
  await Hive.openBox('theme');
 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  Widget _buildWithTheme(BuildContext context,ThemeState state){
    return MaterialApp(
        title: 'ToDo App',
        debugShowCheckedModeBanner: false,
        theme: state.themedata,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
      );
  }
   

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToDoBloc>(
          create: (_) => ToDoBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc,ThemeState>(builder: _buildWithTheme),
    );
  }
}
