import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/routes/new_to_do.dart' as file;

class NewToDoTest extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        accentColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      home: file.NewToDo(),
    );
  }
}

void main() {
  testWidgets('NewToDo Route ', (WidgetTester tester) async {
    await tester.pumpWidget(NewToDoTest());
     var textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(2));
     await tester.enterText(textFields.at(0), 'Hello');
     expect(find.text('Hello'),findsOneWidget);
     await tester.enterText(textFields.at(1), 'World');
     expect(find.text('World'),findsOneWidget);
     var buttons=find.byType(FlatButton);
     expect(buttons, findsNWidgets(2));

  });
}
