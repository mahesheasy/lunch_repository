import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding=EdgeInsets.symmetric(horizontal: 30);
   NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 241, 244, 249),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'profile',
              icons: Icons.person,
            ),
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: '',
              icons: Icons.person,
            ),
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'person',
              icons: Icons.person,
            ),
             const SizedBox(
              height: 48,
            ),
            Divider(color: Colors.black,thickness: 2,),

             const SizedBox(
              height: 48,
            ),
               const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'notification',
              icons: Icons.notifications,
            ),
               const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'settings',
              icons: Icons.settings,
            ),
             const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'logOut',
              icons: Icons.logout,
            ),
          

          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icons}) {
    final Color = Colors.black;
    final hovercolor=Colors.white;
    return ListTile(
      leading: Icon(icons,color: Color,),
      title: Text(text,style: TextStyle(color: Color),),
      hoverColor:hovercolor,
      onTap: ()async{
              await FirebaseAuth.instance.signOut();

      },
    );
  }
}
