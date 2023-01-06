// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:week_challenge_52/components/goal_progress.dart';
import 'package:week_challenge_52/components/week_card.dart';
import 'package:week_challenge_52/models/goal.dart';

class GoalDetailView extends StatefulWidget {
  Goal goal;
  GoalDetailView({super.key, required this.goal});

  @override
  State<GoalDetailView> createState() => _GoalDetailViewState();
}

class _GoalDetailViewState extends State<GoalDetailView> {
  List<dynamic> listItems = [];
  @override
  void initState() {
    prepareListItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
        title: Text(
          widget.goal.name,
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
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(153, 153, 153, 1),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: ((context, index) {
          var element = listItems[index];
          if (element is GoalProgress) {
            return GoalProgress(goal: widget.goal);
          } else if (element is Text) {
            return element;
          } else if (element is WeekCard) {
            return WeekCard(goal: widget.goal);
          } else {
            return const Text("Null");
          }
        }),
      ),
    );
  }

  List<dynamic> prepareListItems() {
    listItems.add(GoalProgress(goal: widget.goal));
    listItems.add(const Text("Upcoming Deposit"));
    listItems.add(WeekCard(goal: widget.goal));
    listItems.add(const Text("All Deposit"));
    List<WeekCard> remainingWeeks = [];
    remainingWeeks.add(WeekCard(goal: widget.goal));
    remainingWeeks.add(WeekCard(goal: widget.goal));
    remainingWeeks.add(WeekCard(goal: widget.goal));
    remainingWeeks.add(WeekCard(goal: widget.goal));
    remainingWeeks.add(WeekCard(goal: widget.goal));
    remainingWeeks.add(WeekCard(goal: widget.goal));
    listItems.addAll(remainingWeeks);
    return listItems;
  }
}
