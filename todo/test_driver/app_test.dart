import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ToDo App test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    var addFAB = find.byValueKey('AddFAB');
    test('Finding add FAB', () async {
      assert(addFAB != null);
      await driver.tap(addFAB);
    });

    test('Adding To Do', () async {
      var titleTextField = find.byValueKey('TitleKey');
      var descriptionTextField = find.byValueKey('DescriptionKey');

      assert(titleTextField != null);
      assert(descriptionTextField != null);
      await driver.tap(titleTextField);
      await driver.enterText('Hello');
      await driver.tap(descriptionTextField);
      await driver.enterText('World');
      var chooseDateButton = find.byValueKey('ChooseDate');
      assert(chooseDateButton != null);
      await driver.tap(chooseDateButton);
      var okButton = find.text('OK');
      assert(okButton != null);
      await driver.tap(okButton);
      var submitButton = find.byValueKey('SubmitButton');
      assert(submitButton != null);
      await driver.tap(submitButton);
    });

    test('Checking for Added ToDo Card', ()async {
      var titleTodoCard = find.text('Hello');
      assert(titleTodoCard != null);
      var deadlineTodoCard = find.text(
          DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 1))));
      assert(deadlineTodoCard != null);
      await driver.tap(titleTodoCard);
    });

    test('detail route', () async {
      var findTitle = find.text('Hello');
      assert(findTitle != null);
      var findDescription = find.text('World');
      assert(findDescription != null);
      var findCreatedOn = find.text(
        DateFormat.yMMMd().format(DateTime.now()),
      );
      assert(findCreatedOn != null);
      var findDeadline = find.text(
        DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 1))),
      );
      assert(findDeadline != null);
    });
  });
}
