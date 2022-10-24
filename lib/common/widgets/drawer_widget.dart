import 'package:flutter/material.dart';

class EasyStoryDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          EasyStoryDrawerHeader(),
          _buildEasyStoryDrawerItem(
              icon: Icons.home,
              text: 'Feed',
              onTap: () => {Navigator.pushNamed(context, '/user-posts')}),
          _buildEasyStoryDrawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () => {
                    //Navigator.pushReplacementNamed(context, MyApp.profile)
                  }),
          _buildEasyStoryDrawerItem(
              icon: Icons.movie,
              text: 'Movies',
              onTap: () => {
                    //Navigator.pushReplacementNamed(context, MyApp.movies)
                  }),
          Divider(),
          _buildEasyStoryDrawerItem(
              icon: Icons.contact_phone,
              text: 'Contact Info',
              onTap: () => {
                    //Navigator.pushReplacementNamed(context, MyApp.contacts)
                  }),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget EasyStoryDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('lib/common/assets/reading.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Text("EasyStory",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildEasyStoryDrawerItem(
      {IconData? icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
