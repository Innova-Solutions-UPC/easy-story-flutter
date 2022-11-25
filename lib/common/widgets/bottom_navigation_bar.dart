import 'package:easy_story_flutter/social/presentation/posts/screens/social_feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import '../../profile/presentation/profile/screens/profile_screen_detail.dart';
import '../../publishing/presentation/publishing_lists_posts/screens/publishing_user_posts.dart';
import '../config/route_generator.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: // Showing the body according to the currentPage index.
            (currentPage == 0)
                ? SocialFeed()
                : (currentPage == 1)
                    ? ProfileScreenDetail()
                    : Error(),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.blueGrey,
        inactiveIconColor: Colors.blueGrey,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "Feed",
          ),
          TabData(
            iconData: Icons.account_circle,
            title: "Profile",
          ),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
            print(currentPage);
          });
        },
      ),
    );
  }
}
