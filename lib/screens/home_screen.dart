import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/about_screen.dart';
import 'package:week_challenge_52/screens/dashboard.dart';
import 'package:week_challenge_52/screens/goals_screen.dart';
import 'package:week_challenge_52/service/goal_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  late GoalService goalService;
  late List<Goal> goalList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Dashboard(),
          GoalsScreen(),
          AboutScreen(),
        ],
      ),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
