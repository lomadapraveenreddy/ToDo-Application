import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/my_fab.dart';
import '../widgets/my_drawer.dart';
import '../routes/all_routes.dart';
import '../widgets/to_do_card.dart';
import '../bloc/to_do_bloc/to_do_bloc.dart';
import '../bloc/theme_bloc/theme_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _calendarController = CalendarController();
  bool _calendarView = false;
  Widget _buildToDoList(_calendarView, ToDoState state) {
    switch (state.todoList.length > 0) {
      case true:
        return ListView.builder(
          itemBuilder: (context, index) {
            return ToDoCard(state.todoList[index]);
          },
          itemCount: state.todoList.length,
        );
        break;
      case false:
        return Center(
          child: Text(
            _calendarView
                ? 'No Work On This Day'
                : 'Add Work To Loose Laziness',
            style: TextStyle(fontSize: 23),
          ),
        );
    }

    if (_calendarView == false && state.todoList.length > 0) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ToDoCard(state.todoList[index]);
        },
        itemCount: state.todoList.length,
      );
    } else {
      return Center(
        child: Text(
          'Add Work To Loose Laziness',
          style: TextStyle(fontSize: 20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox('todoBox');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'To Do',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  setState(() {
                    _calendarView = !_calendarView;
                    _calendarView
                        ? BlocProvider.of<ToDoBloc>(context)
                            .add(ShowOnSelectedDateEvent(DateTime.now()))
                        : BlocProvider.of<ToDoBloc>(context)
                            .add(ShowAllEvent());
                  });
                }),
            IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent());
                }),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    NewToDo.routeName,
                  );
                }),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        drawer: _calendarView ? null : MyDrawer(),
        body: Container(
          child: Column(
            children: <Widget>[
              _calendarView
                  ? TableCalendar(
                      calendarController: _calendarController,
                      initialSelectedDay: DateTime.now(),
                      onDaySelected: (date, _) {
                        BlocProvider.of<ToDoBloc>(context)
                            .add(ShowOnSelectedDateEvent(date));
                      },
                      initialCalendarFormat: CalendarFormat.week,
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonShowsNext: false,
                      ),
                      calendarStyle: CalendarStyle(
                        selectedColor: Theme.of(context).primaryColor,
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: Container(
                  child: BlocBuilder<ToDoBloc, ToDoState>(
                      bloc: BlocProvider.of(context),
                      builder: (BuildContext context, ToDoState state) {
                        return _buildToDoList(_calendarView, state);
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            NewToDo.routeName,
          ),
          child: MyFAB(
            Icons.add,
            key: Key('AddFAB'),
          ),
        ),
      ),
    );
  }
}
