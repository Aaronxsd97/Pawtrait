import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  // const CustomDrawer({Key key}) : super(key: key);

// #TODO Add CustomDrawer

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Set Reminder'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacementNamed(context, '/reminder');
            },
          ),
        ],
      ),
    );
  }
}
