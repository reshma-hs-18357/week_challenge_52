import 'package:flutter/material.dart';
import 'package:week_challenge_52/screens/about_screen.dart';
import 'package:week_challenge_52/screens/dashboard.dart';
import 'package:week_challenge_52/screens/goals_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _returnSelectedIndexWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stairs_outlined),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Learn',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 63, 155, 66),
        unselectedItemColor: const Color.fromARGB(102, 102, 102, 1),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _returnSelectedIndexWidget(int selectedIndex) {
    if (_selectedIndex == 0) {
      return const Dashboard();
    } else if (selectedIndex == 1) {
      return const GoalsScreen();
    } else {
      return const AboutScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
