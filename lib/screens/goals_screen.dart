import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_card.dart';
import 'package:week_challenge_52/components/text_card.dart';
import 'package:week_challenge_52/components/title_card.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/home_screen.dart';

class GoalsScreen extends StatefulWidget {
  final List<Goal> goalList;
  final void Function(Goal? goal) onCardTapped;
  final Filter filter;
  const GoalsScreen({
    super.key,
    required this.goalList,
    required this.onCardTapped,
    required this.filter,
  });

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<dynamic> listItems = [];
  @override
  void initState() {
    listItems = _prepareListItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _goalScreenBody();
  }

  Widget _goalScreenBody() {
    if (widget.goalList.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
              height: 251,
              width: 210,
              child: Image.asset('assets/images/money.png',
                  fit: BoxFit.fitHeight)),
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
      if (widget.filter == Filter.all) {
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
                onCardTapped: widget.onCardTapped,
              );
            }
          }),
        );
      } else {
        return ListView.builder(
          itemCount: widget.goalList.length,
          itemBuilder: ((context, index) {
            Goal goal = widget.goalList[index];
            return GoalCard(
              goal: goal,
              onCardTapped: widget.onCardTapped,
            );
          }),
        );
      }
    }
  }

  List<dynamic> _prepareListItems() {
    List<Goal> weeklyGoals = [];
    List<Goal> monthlyGoals = [];
    for (int i = 0; i < widget.goalList.length; i++) {
      if (widget.goalList[i].savingsChoice == SavingsChoice.weekly) {
        weeklyGoals.add(widget.goalList[i]);
      } else {
        monthlyGoals.add(widget.goalList[i]);
      }
    }
    listItems.add("Weekly Goals");
    listItems.addAll(weeklyGoals);
    listItems.add("Monthly Goals");
    listItems.addAll(monthlyGoals);
    return listItems;
  }
}
