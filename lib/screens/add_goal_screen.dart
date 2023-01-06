// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/screens/new_goal_screen.dart';

class AddGoal extends StatefulWidget {
  Goal goal;
  AddGoal({Key? key, required this.goal}) : super(key: key);

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
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
      body: Container(
        color: Color.fromRGBO(242, 239, 248, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "How would you like to create your goal?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Choose how often you want to save money to reach your goal",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  widget.goal.savingsChoice = SavingsChoice.weekly;
                  navigateToNewGoalScreen(widget.goal);
                },
                child: Container(
                  color: Color.fromARGB(255, 255, 253, 253),
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 150, 0),
                            child: Text(
                              "Weekly",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
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
                        width: 109,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  widget.goal.savingsChoice = SavingsChoice.monthly;
                  navigateToNewGoalScreen(widget.goal);
                },
                child: Container(
                  color: Color.fromRGBO(77, 182, 77, 1),
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 143, 5),
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
                            padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
                            child: SizedBox(
                              height: 60,
                              width: 202,
                              child: Text(
                                "Save every week, for 12 months, an amount determined by you",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/money3.png',
                          height: 130, width: 101, fit: BoxFit.fitHeight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToNewGoalScreen(Goal goal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewGoalScreen(goal: widget.goal),
      ),
    );
  }
}
