import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class AboutRoute extends StatelessWidget {
  static final routeName='/AboutRoute';
  const AboutRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About This App'),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            Text(
              'Hey there!',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'This app helps you to keep track of all your tasks and prioritize on what is important.',
            ),
            Text('Go ahead to know everthing about the app'),
            Text('Want to see the status of the tasks'),
          ],
        ),
      ),
    );
  }
}

// Hey there !

// This app helps you to keep track of all your tasks and prioritize on what is important.

// Want to see all the task in one glance?

//  Easy.  Click on All tasks on sidebar.

// Want to see all completed tasks in one glance ?
//  Easy.  Click on Completed on sidebar.

// Want to see all pending tasks in one glance ?
//  Easy. Click on Incomplete on sidebar.

// Want to see all the tasks on a particular day ?
//  Easy. Go to calendar view from sidebar.

// Want a task to be highlighted ?
//  Easy. Mark it as favorite.
