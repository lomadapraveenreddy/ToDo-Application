import 'package:flutter/material.dart';

class AboutRoute extends StatelessWidget {
  static final routeName = '/AboutRoute';

  @override
  Widget build(BuildContext context) {
    final  _queStyle=TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About This App'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
             horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Hey there!',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              //SizedBox(height: 30,),
              Text(
                'This app helps you to keep track of all your tasks and prioritize on what is important.',
                textAlign: TextAlign.center,
              ),
              //SizedBox(height: 30,),
              Text('Go ahead to know everthing about the app'),
              Text('Change  theme of the app according to your preference',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
              Container(child: Column(
                children: <Widget>[
                  Text('Want to see the status of the tasks?',style: _queStyle,),
                  Text('Mark them as Complete if you are done with the task.'),
                ],
              )),
              //SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(  vertical: 10),
                child: Text(
                    'Add a task by clicking on the + button in the bottom right',textAlign: TextAlign.center,style: _queStyle,),
              ),
              Container(
                margin: EdgeInsets.symmetric(  vertical: 10),
                child: Column(
                  children: <Widget>[
                    Text('Want to know the tasks you completed?',style: _queStyle,),
                    Text('Click on Completed in the drawer'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric( vertical: 10),
                child: Column(
                  children: <Widget>[
                    Text('Want to know the tasks you have to complete?',style: _queStyle,),
                    Text('Click on Active in the drawer'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(  vertical: 10),
                child: Column(
                  children: <Widget>[
                    Text('Want to know the your favourite tasks?',style: _queStyle,),
                    Text('Click on Favourites in the drawer'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(  vertical: 4),
                child: Column(
                  children: <Widget>[
                    Text('Want to know the tasks you completed?',style: _queStyle,),
                    Text('Click on Completed in the drawer'),
                  ],
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

