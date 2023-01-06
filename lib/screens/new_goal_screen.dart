// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/access_button.dart';
import 'package:week_challenge_52/components/input_initial_deposit.dart';
import 'package:week_challenge_52/components/input_goal_name.dart';
import 'package:week_challenge_52/components/input_starting_date.dart';
import 'package:week_challenge_52/components/select_goal_type.dart';
import 'package:week_challenge_52/components/summary_card.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NewGoalScreen extends StatefulWidget {
  Goal goal;
  NewGoalScreen({super.key, required this.goal});

  @override
  State<NewGoalScreen> createState() => _NewGoalScreenState();
}

class _NewGoalScreenState extends State<NewGoalScreen> {
  int step = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
        title: Text(
          "New ${widget.goal.savingsChoiceText()} Goal",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(1, 54, 77, 1),
          ),
        ),
        leadingWidth: 75,
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(153, 153, 153, 1)))),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 286, 6),
              child: Text(
                "Step $step of 4",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
            ),
            LinearPercentIndicator(
              lineHeight: 10,
              width: 102,
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              progressColor: const Color.fromRGBO(77, 182, 77, 1),
              animateFromLastPercent: true,
              percent: step / 4,
              barRadius: const Radius.circular(10),
            ),
            const SizedBox(height: 8),
            // const SelectGoalType(),
            // InputInitialDeposit(goal: widget.goal),
            // InputStartDate(),
            SummaryCard(goal: widget.goal),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccessButton(
                    title: "Back",
                    onPressed: () {},
                  ),
                  AccessButton(
                    title: "Next",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
