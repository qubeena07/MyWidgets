import 'package:flutter/material.dart';
import 'package:my_widgets/screens/analytics_screen.dart';
import 'package:my_widgets/screens/second_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  // final PageController _pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // _pageController.jumpToPage(_selectedIndex);
  }

  static const List _screens = [
    SecondScreen(),
    AnalyticsScreen(),
    SecondScreen()
  ];
  // final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black.withOpacity(0.1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 0),
    );
  }
}
