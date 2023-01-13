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
  late GoalService goalService;

  List<Goal> fetchGoalList() {
    goalList = goalService.fetchGoalList();
    return goalList;
  }

  @override
  void initState() {
    goalService = GoalService.instance;
    setState(() {
      goalList = fetchGoalList();
    });
    super.initState();
    GoalService.instance.addingGoals();
  }

  Widget returnSelectedIndexWidget(int selectedIndex) {
    if (selectedIndex == 0 || selectedIndex == 1) {
      return GoalsScreen(goalList: goalList);
    } else {
      return AboutScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      body: returnSelectedIndexWidget(_selectedIndex),
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: buildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSize appBar() {
    if (_selectedIndex == 0 || _selectedIndex == 1) {
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
    if (GoalService.instance.fetchGoalList().isEmpty) {
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
          onPressed: () async {
            Goal goal = Goal(
              id: goalList.length,
              name: "",
              savingsChoice: SavingsChoice.weekly,
              savingsType: SavingsType.constant,
              initialDeposit: 0.00,
              startDate: DateTime.now(),
              upcomingWeekOrMonth: 5,
              savings: 0.00,
            );
            Goal newGoal = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddGoal(goal: goal),
              ),
            );
            // print(newGoal.toString());
            setState(() {
              goalService.postGoals(newGoal);
              goalList = goalService.fetchGoalList();
            });
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
