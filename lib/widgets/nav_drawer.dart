import 'package:flutter/material.dart';
import 'package:prometeo23/api/fetchUser.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/events_screen.dart';
import 'package:prometeo23/pages/login_signup.dart';
import 'package:prometeo23/pages/umang.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/gallery.dart';
import 'package:prometeo23/pages/sponsors.dart';
import 'package:prometeo23/pages/theme_reveal.dart';
import 'package:prometeo23/pages/updates_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  void initState() {
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/prometeo_home_page.png",
                ),
              ),
            ),
            child: Text(""),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.groups_rounded,
                color: Colors.white,
              ),
              title: const Text('Events',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EventsScreen()))),
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.white),
            title: const Text('Gallery', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gallery()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.currency_rupee, color: Colors.white),
            title: const Text('Past Sponsors',
                style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sponsors()),
              )
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.app_registration_rounded,
          //       color: Colors.white),
          //   title: const Text('PreRegistration',
          //       style: TextStyle(color: Colors.white)),
          //   onTap: () => {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => PreRegistration()),
          //     )
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.newspaper, color: Colors.white),
            title: const Text('News & Updates',
                style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdatesPage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_collection, color: Colors.white),
            title: const Text('Theme Reveal',
                style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemeRevealPage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline_outlined, color: Colors.white),
            title: const Text('Umang', style: TextStyle(color: Colors.white)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Umang(),
                ),
              )
            },
          ),
          (email == "")
              ? ListTile(
                  leading: const Icon(Icons.login, color: Colors.white),
                  title: const Text('Login/Signup',
                      style: TextStyle(color: Colors.white)),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginSignUp(),
                      ),
                    )
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text('Logout',
                      style: TextStyle(color: Colors.white)),
                  onTap: () => {
                    logout(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    )
                  },
                )
        ],
      ),
    );
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:prometeo23/constants.dart';
// import 'package:prometeo23/pages/login_signup.dart';
// import 'package:prometeo23/pages/umang.dart';
// import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
// import 'package:prometeo23/pages/events_screen.dart';
// import 'package:prometeo23/pages/gallery.dart';
// import 'package:prometeo23/pages/preregistration.dart';
// import 'package:prometeo23/pages/signup1.dart';
// import 'package:prometeo23/pages/sponsors.dart';
// import 'package:prometeo23/pages/theme_reveal.dart';
// import 'package:prometeo23/pages/updates_page.dart';

// class NavDrawer extends StatelessWidget {
//   const NavDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//         child: Container(
//           decoration: BoxDecoration(
//             //glass morphism
//             color: Colors.grey.withOpacity(0.2),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3), // changes position of shadow
//               ),
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, -3), // changes position of shadow
//               )
//             ],
//             borderRadius: const BorderRadius.all(Radius.circular(12.5)),
//           ),
//           child: Drawer(
//             backgroundColor: bgColor.withOpacity(0.4),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: <Widget>[
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(
                //         "assets/prometeo_home_page.png",
                //       ),
                //     ),
                //   ),
                //   child: Text(""),
                // ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.home,
                //     color: Colors.white,
                //   ),
                //   title: const Text(
                //     'Home',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomePage()),
                //     )
                //   },
                // ),
                // ListTile(
                //     leading: const Icon(
                //       Icons.groups_rounded,
                //       color: Colors.white,
                //     ),
                //     title: const Text('Events',
                //         style: TextStyle(
                //           color: Colors.white,
                //         )),
                //     onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const EventsScreen()))),
                // ListTile(
                //   leading: const Icon(Icons.photo, color: Colors.white),
                //   title: const Text('Gallery',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Gallery()),
                //     )
                //   },
                // ),
                // ListTile(
                //   leading:
                //       const Icon(Icons.currency_rupee, color: Colors.white),
                //   title: const Text('Past Sponsors',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Sponsors()),
                //     )
                //   },
                // ),
                // // ListTile(
                // //   leading: const Icon(Icons.app_registration_rounded,
                // //       color: Colors.white),
                // //   title: const Text('PreRegistration',
                // //       style: TextStyle(color: Colors.white)),
                // //   onTap: () => {
                // //     Navigator.push(
                // //       context,
                // //       MaterialPageRoute(
                // //           builder: (context) => PreRegistration()),
                // //     )
                // //   },
                // // ),
                // ListTile(
                //   leading: const Icon(Icons.newspaper, color: Colors.white),
                //   title: const Text('News & Updates',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => UpdatesPage()),
                //     )
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.video_collection, color: Colors.white),
                //   title: const Text('Theme Reveal',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => ThemeRevealPage()),
                //     )
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.favorite_outline_outlined,
                //       color: Colors.white),
                //   title: const Text('Umang',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const Umang(),
                //       ),
                //     )
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.login, color: Colors.white),
                //   title: const Text('Login/Signup',
                //       style: TextStyle(color: Colors.white)),
                //   onTap: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const LoginSignUp(),
                //       ),
                //     )
                //   },
                // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
