// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last,
import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/about_screen.dart';
import 'package:week_challenge_52/screens/detail_view_screen.dart';
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
  List<Goal> newGoalList = [];
  List<Widget> screens = [];
  late GoalService goalService;
  Filter filter = Filter.all;

  List<Goal> _fetchGoalList() {
    goalList = goalService.fetchGoalList();
    return goalList;
  }

  @override
  void initState() {
    goalService = GoalService.instance;
    setState(() {
      goalList = _fetchGoalList();
    });

    super.initState();
    GoalService.instance.addingGoals();
  }

  List<Goal> getGoalListAfterFilter() {
    print(filter);
    if (filter == Filter.weekly) {
      newGoalList.clear();
      for (int i = 0; i < goalList.length; i++) {
        if (goalList[i].savingsChoice == SavingsChoice.weekly) {
          newGoalList.add(goalList[i]);
        }
      }
    } else if (filter == Filter.monthly) {
      newGoalList.clear();
      for (int i = 0; i < goalList.length; i++) {
        if (goalList[i].savingsChoice == SavingsChoice.monthly) {
          newGoalList.add(goalList[i]);
        }
      }
    } else {
      newGoalList.clear();
      newGoalList.addAll(goalList);
    }
    return newGoalList;
  }

  Widget _returnSelectedIndexWidget(int selectedIndex) {
    if (selectedIndex == 0 || selectedIndex == 1) {
      return GoalsScreen(
        goalList: getGoalListAfterFilter(),
        onCardTapped: onCardTapped,
      );
    } else {
      return AboutScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      body: _returnSelectedIndexWidget(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButton: _buildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSize _appBar() {
    if (_selectedIndex == 0 || _selectedIndex == 1) {
      return PreferredSize(
          child: AppBar(
            centerTitle: true,
            backgroundColor: _backgroundColor(),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: _backgroundColor(),
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
                padding: const EdgeInsets.all(10.0),
                child: PopupMenuButton(
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: Filter.all,
                      child: Text("All"),
                    ),
                    PopupMenuItem(
                      value: Filter.weekly,
                      child: const Text("Weekly"),
                    ),
                    PopupMenuItem(
                      value: Filter.monthly,
                      child: const Text("Monthly"),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      filter = value;
                    });
                  },
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

  Color _backgroundColor() {
    if (GoalService.instance.fetchGoalList().isEmpty) {
      return const Color.fromRGBO(242, 239, 248, 1);
    } else {
      return Colors.white;
    }
  }

  Widget _buildBottomBar() => SizedBox(
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

  Widget _buildNavigateButton() => SizedBox(
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
              upcomingWeekOrMonth: 0,
              savings: 0.00,
            );
            Goal newGoal = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddGoal(goal: goal),
              ),
            );
            setState(() {
              goalService.postGoals(newGoal);
              goalList = goalService.fetchGoalList();
            });
          },
          child: Icon(Icons.add, size: 40),
        ),
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onCardTapped(Goal? goal) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoalDetailView(goal: goal!),
      ),
    );
    setState(() {
      goalList = GoalService.instance.fetchGoalList();
    });
  }
}

enum Filter { all, weekly, monthly }
