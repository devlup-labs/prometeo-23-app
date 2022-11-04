// import 'package:flutter/material.dart';
// import 'package:prometeo23/pages/bottom_navigation_pages/profile.dart';
// import 'package:prometeo23/pages/bottom_navigation_pages/schedule_page.dart';
// import '../pages/bottom_navigation_pages/home_page.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   List pages = [
//     HomePage(),
//     Profile(),
//     Schedule(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         tabBar: CupertinoTabBar(
//           activeColor: Color(0xff64ffda),
//           backgroundColor: Color.fromARGB(0, 0, 0, 0),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 CupertinoIcons.home,
//                 size: 24,
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 CupertinoIcons.person,
//                 size: 24,
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 CupertinoIcons.calendar,
//                 size: 24,
//               ),
//             ),
//           ],
//         ),
//         tabBuilder: ((context, index) {
//           return CupertinoTabView(
//             builder: (context) {
//               print("index");
//               print(index);
//               return pages[index];
//             },
//           );
//         }));
//   }
// }
