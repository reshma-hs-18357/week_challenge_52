import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/components/goal_choice_card.dart';
import 'package:week_challenge_52/models/goal.dart';

class AddGoal extends StatelessWidget {
  final Goal goal;
  final void Function(Goal goal) navigateToNewGoalScreen;
  const AddGoal({
    super.key,
    required this.goal,
    required this.navigateToNewGoalScreen,
  });

  static Color color = const Color.fromRGBO(242, 239, 248, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        title: const Text(
          "New Goal",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(1, 54, 77, 1)),
        ),
        leadingWidth: 75,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const HeadingComponent(
                  title: "How would you like to create your goal?"),
              const SizedBox(height: 10),
              const Text(
                "Choose how often you want to save money to reach your goal",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  goal.savingsChoice = SavingsChoice.weekly;
                  navigateToNewGoalScreen(goal);
                },
                child: const GoalChoiceCard(
                  title: "Weekly",
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  goal.savingsChoice = SavingsChoice.monthly;
                  navigateToNewGoalScreen(goal);
                },
                child: const GoalChoiceCard(
                  title: "Monthly",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
