// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last,
import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/about_screen.dart';
import 'package:week_challenge_52/screens/goals_screen.dart';
import 'package:week_challenge_52/screens/add_goal_screen.dart';
import 'package:week_challenge_52/service/goal_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Goal> goalList = [];
  List<Widget> screens = [];

  @override
  void initState() {
    goalList = GoalService().fetchGoalList();
    screens = [
      GoalsScreen(goalList: goalList),
      GoalsScreen(goalList: goalList),
      AboutScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      body: screens[_selectedIndex],
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: buildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSize appBar() {
    if (_selectedIndex == 0) {
      return PreferredSize(
          child: AppBar(
            backgroundColor: backgroundColor(),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: backgroundColor(),
                child: Image.asset(
                  'assets/images/piggy.png',
                  height: 44,
                  width: 44,
                ),
              ),
            ),
            title: Text(
              "52 Weeks",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/crown.png',
                  height: 30,
                  width: 30,
                ),
              )
            ],
          ),
          preferredSize: Size.fromHeight(72));
    } else {
      return PreferredSize(
        child: AppBar(
          backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
          title: const Text(
            "About",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(50),
      );
    }
  }

  Color backgroundColor() {
    if (GoalService().fetchGoalList().isEmpty) {
      return const Color.fromRGBO(242, 239, 248, 1);
    } else {
      return Color.fromARGB(255, 248, 248, 248);
    }
  }

  Widget buildBottomBar() => SizedBox(
        height: 90,
        child: BottomNavigationBar(
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.stairs_outlined),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.white, size: 0),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Learn',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 63, 155, 66),
          unselectedItemColor: Color.fromARGB(102, 102, 102, 1),
          onTap: _onItemTapped,
        ),
      );

  Widget buildNavigateButton() => SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Goal goal = Goal(
              id: goalList.length,
              name: "",
              savingsChoice: SavingsChoice.weekly,
              savingsType: SavingsType.constant,
              initialDeposit: 0.00,
              startDate: DateTime.now(),
              currentWeekOrMonth: 0,
              savings: 0.00,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddGoal(goal: goal),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
