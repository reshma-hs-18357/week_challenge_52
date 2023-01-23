import 'package:flutter/material.dart';
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
              const Text(
                "How would you like to create your goal?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                child: Card(
                  elevation: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16, top: 16, right: 150),
                              child: Text(
                                "Weekly",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 4, 16),
                              child: SizedBox(
                                height: 60,
                                width: 202,
                                child: Text(
                                  "Save every week, for 52 weeks, an amount determined by you",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/images/money2.png',
                          height: 136,
                          width: 95,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  goal.savingsChoice = SavingsChoice.monthly;
                  navigateToNewGoalScreen(goal);
                },
                child: Card(
                  color: const Color.fromRGBO(77, 182, 77, 1),
                  elevation: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 16, 140, 5),
                              child: Text(
                                "Monthly",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 5, 10, 16),
                              child: SizedBox(
                                height: 60,
                                width: 200,
                                child: Text(
                                  "Save every month, for 12 months, an amount determined by you",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset('assets/images/money3.png',
                            height: 130, width: 88, fit: BoxFit.fitHeight),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
