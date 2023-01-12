// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_progress.dart';
import 'package:week_challenge_52/components/text_card.dart';
import 'package:week_challenge_52/components/week_month_card.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:intl/intl.dart';

class GoalDetailView extends StatefulWidget {
  Goal goal;
  GoalDetailView({super.key, required this.goal});

  @override
  State<GoalDetailView> createState() => _GoalDetailViewState();
}

class _GoalDetailViewState extends State<GoalDetailView> {
  List<dynamic> listItems = [];
  List<WeekorMonthCard> remainingWeeksorMonths = [];
  List<WeekorMonthCard> upcomingWeekorMonth = [];
  List<WeekorMonthCard> completedWeeksorMonths = [];
  int completed = 0;

  @override
  void initState() {
    remainingWeeksorMonths = getTotalWeeksOrMonths();
    upcomingWeekorMonth.add(remainingWeeksorMonths[0]);
    remainingWeeksorMonths.removeAt(0);
    prepareListItems();
    super.initState();
  }

  List<WeekorMonthCard> getTotalWeeksOrMonths() {
    if (widget.goal.savingsChoiceText() == "Weekly") {
      for (int i = 1; i < 53; i++) {
        remainingWeeksorMonths.add(WeekorMonthCard(
          choice: getSavingsChoice(),
          weekOrMonth: i,
          date: DateFormat('dd/MM/yy').format(DateTime(
            widget.goal.startDate.year,
            widget.goal.startDate.month,
            widget.goal.startDate.day + 7 * (i - 1),
          )),
          deposit: (widget.goal.savingsType == SavingsType.constant)
              ? widget.goal.initialDeposit
              : widget.goal.initialDeposit * i,
          onCircleIconButtonTapped: onCircleIconButtonTapped,
        ));
      }
    } else {
      for (int i = 1; i < 13; i++) {
        remainingWeeksorMonths.add(WeekorMonthCard(
          choice: getSavingsChoice(),
          weekOrMonth: i,
          date: DateFormat('dd/MM/yy').format(DateTime(
            widget.goal.startDate.year,
            widget.goal.startDate.month + 1 * (i - 1),
            widget.goal.startDate.day,
          )),
          deposit: (widget.goal.savingsType == SavingsType.constant)
              ? widget.goal.initialDeposit
              : widget.goal.initialDeposit * i,
          onCircleIconButtonTapped: onCircleIconButtonTapped,
        ));
      }
    }
    return remainingWeeksorMonths;
  }

  List<WeekorMonthCard> getUpcomingWeekOrMonth() {
    return upcomingWeekorMonth;
  }

  List<WeekorMonthCard> completedWeekOrMonth() {
    return completedWeeksorMonths;
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
            return WeekorMonthCard(
              choice: element.choice,
              weekOrMonth: element.weekOrMonth,
              date: element.date,
              deposit: element.deposit,
              onCircleIconButtonTapped: element.onCircleIconButtonTapped,
            );
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
    listItems.addAll(getUpcomingWeekOrMonth());
    listItems.add(TextCard(text: "All Deposit"));
    listItems.addAll(completedWeeksorMonths);
    listItems.addAll(remainingWeeksorMonths);
    return listItems;
  }

  String getSavingsChoice() {
    if (widget.goal.savingsChoice == SavingsChoice.weekly) {
      return "Week";
    } else {
      return "Month";
    }
  }

  void onCircleIconButtonTapped() {
    setState(() {
      completed++;
      completedWeeksorMonths.add(upcomingWeekorMonth.removeAt(0));
      widget.goal.completedWeekOrMonth++;
      prepareListItems();
    });
  }
}
