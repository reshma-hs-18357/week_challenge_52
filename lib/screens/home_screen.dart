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
  late int _selectedIndex;
  late GoalService goalService;
  late List<Goal> goalList;
  late List<Widget> _screens;
  late PageController _pageController;

  @override
  void initState() {
    _selectedIndex = 1;
    _screens = const [
      Dashboard(),
      GoalsScreen(),
      AboutScreen(),
    ];
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
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
      _pageController.jumpToPage(index);
    });
  }
}
