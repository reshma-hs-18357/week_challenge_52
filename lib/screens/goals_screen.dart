import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_card.dart';
import 'package:week_challenge_52/components/title_card.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/add_goal_screen.dart';
import 'package:week_challenge_52/screens/detail_view_screen.dart';
import 'package:week_challenge_52/screens/new_goal_screen.dart';
import 'package:week_challenge_52/service/goal_service.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});
  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<Goal> _goalList = [];
  List<Goal> _newGoalList = [];
  late GoalService _goalService;
  Filter filter = Filter.all;
  static Color bgColor = const Color.fromRGBO(242, 239, 248, 1);

  @override
  void initState() {
    print("hi from goals screen");
    _goalService = GoalService.instance;
    setState(() {
      _goalList = _goalService.fetchGoalList();
    });
    super.initState();
  }

  void onCardTapped(Goal goal) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoalDetailView(
          goal: goal,
        ),
      ),
    );
    setState(() {
      _goalList = _goalService.fetchGoalList();
    });
  }

  void navigateToNewGoalScreen(Goal goal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewGoalScreen(
          goal: goal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: AppBar(
          centerTitle: true,
          backgroundColor: bgColor,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 22,
              child: Image.asset(
                'assets/images/piggy.png',
                height: 44,
                width: 44,
              ),
            ),
          ),
          title: const Text(
            "52 Weeks",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PopupMenuButton(
                icon: const Icon(
                  Icons.menu_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: Filter.all,
                    child: Text("All"),
                  ),
                  const PopupMenuItem(
                    value: Filter.weekly,
                    child: Text("Weekly"),
                  ),
                  const PopupMenuItem(
                    value: Filter.monthly,
                    child: Text("Monthly"),
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
      ),
      body: _goalScreenBody(),
      floatingActionButton: _buildNavigateButton(),
    );
  }

  Widget _goalScreenBody() {
    if (_goalList.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            height: 251,
            width: 210,
            child:
                Image.asset('assets/images/money.png', fit: BoxFit.fitHeight),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(53, 30, 53, 16),
            child: SizedBox(
              height: 60,
              width: 269,
              child: Text(
                "Oops! You have no registered goals",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Text("Add new goals using the button(+)"),
          )
        ],
      );
    } else {
      if (filter == Filter.all) {
        List<dynamic> listItems = _prepareListItems();
        return ListView.builder(
          itemCount: listItems.length,
          itemBuilder: ((context, index) {
            var element = listItems[index];
            if (element is String) {
              return TitleCard(title: element);
            } else {
              Goal goal = listItems[index];
              return GoalCard(
                goal: goal,
                onCardTapped: onCardTapped,
              );
            }
          }),
        );
      } else {
        _newGoalList = _getGoalListAfterFilter();
        return ListView.builder(
          itemCount: _newGoalList.length,
          itemBuilder: ((context, index) {
            Goal goal = _newGoalList[index];
            return GoalCard(
              goal: goal,
              onCardTapped: onCardTapped,
            );
          }),
        );
      }
    }
  }

  List<dynamic> _prepareListItems() {
    List<dynamic> listItems = [];
    List<Goal> weeklyGoals = [];
    List<Goal> monthlyGoals = [];
    List<Goal> completedGoals = [];
    for (Goal goal in _goalList) {
      if (goal.getPercent() == 1) {
        completedGoals.add(goal);
      } else {
        if (goal.savingsChoice == SavingsChoice.weekly) {
          weeklyGoals.add(goal);
        } else {
          monthlyGoals.add(goal);
        }
      }
    }
    if (weeklyGoals.isNotEmpty) {
      listItems.add("Weekly Goals");
      listItems.addAll(weeklyGoals);
    }
    if (monthlyGoals.isNotEmpty) {
      listItems.add("Monthly Goals");
      listItems.addAll(monthlyGoals);
    }
    if (completedGoals.isNotEmpty) {
      listItems.add("Completed Goals");
      listItems.addAll(completedGoals);
    }

    return listItems;
  }

  List<Goal> _getGoalListAfterFilter() {
    if (filter == Filter.weekly) {
      _newGoalList.clear();
      for (int i = 0; i < _goalList.length; i++) {
        if (_goalList[i].savingsChoice == SavingsChoice.weekly) {
          _newGoalList.add(_goalList[i]);
        }
      }
    } else if (filter == Filter.monthly) {
      _newGoalList.clear();
      for (int i = 0; i < _goalList.length; i++) {
        if (_goalList[i].savingsChoice == SavingsChoice.monthly) {
          _newGoalList.add(_goalList[i]);
        }
      }
    } else {
      return _goalList;
    }
    return _newGoalList;
  }

  Widget _buildNavigateButton() {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () async {
        Goal goal = Goal(
          id: _goalList.length,
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
            builder: (context) => AddGoal(
              goal: goal,
              navigateToNewGoalScreen: navigateToNewGoalScreen,
            ),
          ),
        );
        setState(() {
          _goalService.postGoals(newGoal);
          _goalList = _goalService.fetchGoalList();
        });
      },
      child: const Icon(Icons.add, size: 40),
    );
  }
}

enum Filter { all, weekly, monthly }

enum AccessButtonsEnum { back, next }
