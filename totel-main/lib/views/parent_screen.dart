import 'package:flutter/material.dart';
import 'package:totel/views/screens/home_screen.dart';
import 'package:totel/views/screens/offers_screen.dart';
import 'package:totel/views/screens/settings_screen.dart';
import 'package:totel/views/screens/waiting_screen.dart.dart';
import 'package:totel/constants/app_color.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int _currentIndex = 0;
  final List<Widget> views = <Widget>[
    HomeScreen(),
    const WaitingScreen(),
    const OffersScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.selectedItemColor,
        unselectedItemColor: AppColor.unSelectedItemColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              label: 'Home',
              tooltip: 'Homescreen'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_array_outlined, size: 30),
              label: 'Waiting Offers',
              tooltip: 'Waiting Screen'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public_outlined, size: 35),
              label: 'Offers',
              tooltip: 'Offers Screen'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined, size: 35),
              label: 'Settings',
              tooltip: 'Settings Screen'),
        ],
      ),
    );
  }
}
