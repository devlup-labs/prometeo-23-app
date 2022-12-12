import 'package:flutter/material.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/gallery.dart';
import 'package:prometeo23/pages/preregistration.dart';
import 'package:prometeo23/pages/sponsors.dart';
import 'package:prometeo23/pages/updates_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff110F16),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff110F16),
              image: DecorationImage(
                image: AssetImage(
                  "assets/prometeo_home_page.png",
                ),
              ),
            ),
            child: Text(""),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xff64ffda),
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              )
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.event, color: Color(0xff64ffda)),
          //   title: Text('Events', style: TextStyle(color: Colors.white)),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings, color: Color(0xff64ffda)),
          //   title: Text('Settings', style: TextStyle(color: Colors.white)),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.verified_user, color: Color(0xff64ffda)),
          //   title: Text('Profile', style: TextStyle(color: Colors.white)),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app, color: Color(0xff64ffda)),
          //   title: Text('Back', style: TextStyle(color: Colors.white)),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.favorite_border, color: Colors.pink),
            title: Text('Gallery', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Gallery()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee, color: Colors.orange),
            title: Text('Past Sponsors', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sponsors()),
              )
            },
          ),
          ListTile(
            leading:
                Icon(Icons.app_registration_rounded, color: Colors.lightBlue),
            title:
                Text('PreRegistration', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreRegistration()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper, color: Colors.teal),
            title:
                Text('News & Updates', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatesPage()),
              )
            },
          ),
        ],
      ),
    );
  }
}
