import 'package:flutter/material.dart';

import './routes/all_routes.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args=settings.arguments;

    switch(settings.name){
      case '/':
      
      return MaterialPageRoute(builder: (_)=>HomePage());
      case '/newToDo':
      print('new to do route');
        return MaterialPageRoute(builder: (_)=>NewToDo());
      case '/DetailView':
      print('DetailView');
      print(args);
      if(args is String)
      {
        return MaterialPageRoute(builder: (_)=>DetailToDoView(args));
      }
      return _errorRoute();
      default:
      return _errorRoute();
    }

  }
static  Route<dynamic> _errorRoute(){
  return MaterialPageRoute(builder: (_){
    return Scaffold(
      appBar: AppBar(title: Text('Error'),
      ),
      body: Center(
        child:Text('Error'),
      ),
    );
  });
}
}

