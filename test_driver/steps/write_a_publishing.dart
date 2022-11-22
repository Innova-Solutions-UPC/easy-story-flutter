import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class InputTheInformationAboutThePost
    extends When2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(counterKeyValue, counter) async {
    final locator = find.byValueKey(counterKeyValue);
    expect(await FlutterDriverUtils.getText(world.driver!, locator), counter);
  }

  @override
  RegExp get pattern => RegExp(
      r"ingresa la informacion correspondiente a la publicacion And select the button create ");
}

class TheUserCreateAPost extends Given2WithWorld<String, int, FlutterWorld> {
  @override
  Future<void> executeStep(buttonKeyValue, counter) async {
    final locator = find.byTooltip(buttonKeyValue);
    for (var i = 0; i < counter; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator);
    }
  }

  @override
  RegExp get pattern => RegExp(r"que el usuario desea crear una publicacion");
}

class theResponseIs200 extends Given2WithWorld<String, String, FlutterWorld> {
  theResponseIs200()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));
  @override
  Future<void> executeStep(counterValKey, counter) async {
    final locator = find.byValueKey(counterValKey);
    expect(await FlutterDriverUtils.getText(world.driver!, locator), counter);
  }

  @override
  RegExp get pattern => RegExp(r"Then the response is 200");
}
