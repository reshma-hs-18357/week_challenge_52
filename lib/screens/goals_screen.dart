// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_card.dart';
import 'package:week_challenge_52/models/goal.dart';

class GoalsScreen extends StatelessWidget {
  List<Goal> goalList;
  GoalsScreen({super.key, required this.goalList});

  Widget goalScreenBody() {
    if (goalList.isEmpty) {
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
      return ListView.builder(
        itemCount: goalList.length,
        itemBuilder: ((context, index) {
          Goal goal = goalList[index];
          return GoalCard(goal: goal);
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return goalScreenBody();
  }
}
