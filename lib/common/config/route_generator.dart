import 'package:easy_story_flutter/iam/presentation/sign_in/login_screen_detail.dart';
import 'package:easy_story_flutter/profile/presentation/profile/screens/profile_edit_screen.dart';
import 'package:easy_story_flutter/profile/presentation/profile/screens/profile_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/screens/update_publishing_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/screens/write_publishing_screen_detail.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/screens/publishing_user_post_details.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/screens/publishing_user_posts.dart';
import 'package:easy_story_flutter/social/presentation/posts/screens/social_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../publishing/presentation/publishing_create_edit_posts/screens/update_publishing_screen_detail.dart';
import '../../social/presentation/posts/screens/social_post_detail.dart';
import '../widgets/bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final arguments = settings;

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
              builder: (_) => UpdatePublishingScreenDetail(),
              settings: arguments);
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
      case '/details-publishing':
        try {
          return MaterialPageRoute(
            builder: (_) => PublishingUserPostDetails(),
            settings: arguments,
          );
        } catch (e) {
          return _errorRoute();
        }
      case '/profile':
        try {
          return MaterialPageRoute(
            builder: (_) => ProfileScreenDetail(),
            settings: arguments,
          );
        } catch (e) {
          return _errorRoute();
        }
      case '/edit-profile':
        try {
          return MaterialPageRoute(
              builder: (_) => ProfileEditScreen(), settings: arguments);
        } catch (e) {
          return _errorRoute();
        }
      case '/social-feed':
        try {
          return MaterialPageRoute(
            builder: (_) => SocialFeed(),
            settings: arguments,
          );
        } catch (e) {
          return _errorRoute();
        }
      case '/detail-feed-post':
        try {
          return MaterialPageRoute(
            builder: (_) => SocialPostDetails(),
            settings: arguments,
          );
        } catch (e) {
          return _errorRoute();
        }

      case '/bottom-navigation-states':
        try {
          return MaterialPageRoute(
            builder: (_) => BottomNavBar(),
            settings: arguments,
          );
        } catch (e) {
          return _errorRoute();
        }

      default:
        // the last option
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

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
