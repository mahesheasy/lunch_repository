import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  // final User user;
  //final padding = EdgeInsets.symmetric(horizontal: 30);
  NavigationDrawerWidget(User? user, BuildContext context, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Test'),
            accountEmail: Text(
              user!.email!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                    color: Colors.white,
                  ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('HOME'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.corporate_fare),
            title: Text('POWERED BY'),
            trailing: Text(
              "Easy cloud",
              style: TextStyle(color: Color.fromARGB(255, 136, 135, 133)),
            ),
            onTap: () {
              // Handle settings
            },
          ),
          Divider(),
          ListTile(
            hoverColor:Colors.amber ,
            focusColor: Colors.amber,
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
            trailing: Text(
              "OpenPlayStore",
              style: TextStyle(color: Color.fromARGB(255, 136, 135, 133)),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
