import 'package:flutter/cupertino.dart';
import '../pages/home_page/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color(0xff64ffda),
        backgroundColor: Color(0xff0a182e),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar)),
        ],),
      tabBuilder: ((context, index) {
        return CupertinoTabView(  
          builder: (context){
            return HomePage();
          },
        );
      })
    );
  }
}