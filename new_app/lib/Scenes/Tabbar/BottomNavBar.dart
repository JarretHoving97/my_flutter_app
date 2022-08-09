import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Scenes/Event/EventPage.dart';
import 'package:new_app/Scenes/News/NewsPage.dart';
import 'package:new_app/Util/AppColor.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    NewsPage(),
    EventPage(),
    Center(
        child: Icon(
      Icons.person,
      size: 150,
    ))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.appColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper,
              ),
              label: 'Nieuws',
              backgroundColor: AppColor.appBackground),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Evenementen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profiel',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
