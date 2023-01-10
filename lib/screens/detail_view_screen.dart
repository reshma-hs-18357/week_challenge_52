// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_progress.dart';
import 'package:week_challenge_52/components/text_card.dart';
import 'package:week_challenge_52/components/week_month_card.dart';
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
          } else if (element is TextCard) {
            return element;
          } else if (element is WeekorMonthCard) {
            return WeekorMonthCard(goal: widget.goal, weekOrMonth: 1);
          } else {
            return const Text("Null");
          }
        }),
      ),
    );
  }

  List<dynamic> prepareListItems() {
    listItems.add(GoalProgress(goal: widget.goal));
    listItems.add(TextCard(text: "Upcoming Deposit"));
    listItems.add(WeekorMonthCard(goal: widget.goal, weekOrMonth: 1));
    listItems.add(TextCard(text: "All Deposit"));
    List<WeekorMonthCard> remainingWeeks = [];
    if (widget.goal.savingsChoiceText() == "Weekly") {
      for (int i = 0; i < 51; i++) {
        remainingWeeks
            .add(WeekorMonthCard(goal: widget.goal, weekOrMonth: i + 2));
      }
    } else {
      for (int i = 0; i < 11; i++) {
        remainingWeeks
            .add(WeekorMonthCard(goal: widget.goal, weekOrMonth: i + 2));
      }
    }
    listItems.addAll(remainingWeeks);
    return listItems;
  }
}
