import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawerWidget extends StatelessWidget {
  // final User user;
  //final padding = EdgeInsets.symmetric(horizontal: 30);

  NavigationDrawerWidget(
    User? user,
    BuildContext context, {
    super.key,
  });

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
            decoration: BoxDecoration(color: Color.fromARGB(255, 8, 8, 8)),
            accountName: Text('Easy Cloud'),
            accountEmail: Text(
              user!.email!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                    color: Colors.white,
                  ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://png.pngtree.com/element_our/sm/20180410/sm_5acd1797b5783.jpg'),
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
            onTap: () async {
              // ignore: deprecated_member_use
              await launch('https://easycloud.in/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
            trailing: Text(
              "OpenPlayStore",
              style: TextStyle(color: Color.fromARGB(255, 136, 135, 133)),
            ),
            onTap: () async {
              // ignore: deprecated_member_use
              await launch(
                  'https://play.google.com/store/apps/details?id=in.easycloud.mealmaven&pli=1');
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () {

          //      Navigator.pop(context);
          //   },
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'logout',
              style: TextStyle(color: Color.fromARGB(255, 1, 0, 0)),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
