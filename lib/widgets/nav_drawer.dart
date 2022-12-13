import 'package:flutter/material.dart';
import 'package:prometeo23/pages/Umang.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/gallery.dart';
import 'package:prometeo23/pages/preregistration.dart';
import 'package:prometeo23/pages/sponsors.dart';
import 'package:prometeo23/pages/theme_reveal.dart';
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
          ListTile(
            leading: Icon(Icons.photo, color: Colors.pink),
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
          ListTile(
            leading: Icon(Icons.video_collection, color: Colors.purple[300]),
            title: Text('Theme Reveal', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeRevealPage()),
              )
            },
          ),
          ListTile(
            leading:
                Icon(Icons.favorite_outline_outlined, color: Colors.amber[300]),
            title: Text('Umang', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Umang()),
              )
            },
          ),
        ],
      ),
    );
  }
}
