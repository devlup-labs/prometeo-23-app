import 'package:flutter/cupertino.dart';
import 'package:prometeo23/pages/home_page/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home) , label: 'home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person) , label: 'profile'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar) , label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings) , label: 'Settings'),
      ]), 
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