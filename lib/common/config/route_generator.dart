import 'package:easy_story_flutter/iam/presentation/sign_in/login_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/screens/update_publishing_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/screens/write_publishing_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/screens/publishing_user_posts.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreenDetail());
      case '/login':
        // Validation of correct data type
        try {
          return MaterialPageRoute(builder: (_) => LoginScreenDetail());
        } catch (e) {
          // If args is not of the correct type, return an error page.
          // You can also throw an exception while in development.
          return _errorRoute();
        }

      case '/write-publishing':
        try {
          return MaterialPageRoute(
              builder: (_) => WritePublishingScreenDetail());
        } catch (e) {
          // If args is not of the correct type, return an error page.
          // You can also throw an exception while in development.
          return _errorRoute();
        }
      case '/edit-publishing':
        try {
          return MaterialPageRoute(
              builder: (_) => UpdatePublishingScreenDetail(publishId: 22));
        } catch (e) {
          // If args is not of the correct type, return an error page.
          // You can also throw an exception while in development.
          return _errorRoute();
        }
      case '/user-posts':
        try {
          return MaterialPageRoute(builder: (_) => PublishingUserPosts());
        } catch (e) {
          // If args is not of the correct type, return an error page.
          // You can also throw an exception while in development.
          return _errorRoute();
        }
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
