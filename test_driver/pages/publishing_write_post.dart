import 'package:flutter_driver/flutter_driver.dart';

class PublishingWritePost {
  final txtCounter = find.byValueKey('counterText');
  final bttnIncrement = find.byValueKey('Increment');
  final bttnAdd = find.byValueKey('add');
  final bttnSubtract = find.byValueKey('subtract');
  final txtAllert = find.byValueKey('allert_text');
  final bttnClose = find.byValueKey('close_button');

  FlutterDriver? _driver;

  HomePage(FlutterDriver? driver) {
    this._driver = driver;
  }

  Future<String> getCounterValue() async {
    return await _driver!.getText(txtCounter);
  }
}
