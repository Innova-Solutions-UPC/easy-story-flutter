import 'package:flutter/material.dart';
import './injections.dart' as di;
import 'package:easy_story_flutter/common/config/route_generator.dart';

Future<void> main() async {
  // initialize dependencies injections
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
