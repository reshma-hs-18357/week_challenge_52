// ignore_for_file: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_progress.dart';
import 'package:week_challenge_52/components/text_card.dart';
import 'package:week_challenge_52/components/week_month_card.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/models/goal_progress_model.dart';
import 'package:week_challenge_52/models/week_month_model.dart';

class GoalDetailView extends StatefulWidget {
  Goal goal;
  GoalDetailView({super.key, required this.goal});

  @override
  State<GoalDetailView> createState() => _GoalDetailViewState();
}

class _GoalDetailViewState extends State<GoalDetailView> {
  late Goal goal;
  List<dynamic> listItems = [];
  List<WeekOrMonthModel> remainingWeeksorMonths = [];
  List<WeekOrMonthModel> upcomingWeekorMonth = [];
  List<WeekOrMonthModel> completedWeeksorMonths = [];
  int completed = 0;

  @override
  void initState() {
    goal = widget.goal;
    remainingWeeksorMonths = getTotalWeeksOrMonths();
    upcomingWeekorMonth.add(remainingWeeksorMonths[0]);
    remainingWeeksorMonths.removeAt(0);
    prepareListItems();
    super.initState();
  }

  List<WeekOrMonthModel> getTotalWeeksOrMonths() {
    if (widget.goal.savingsChoiceText() == "Weekly") {
      for (int i = 1; i < 53; i++) {
        remainingWeeksorMonths.add(WeekOrMonthModel(
          completed: false,
          currentWeekOrMonth: i,
          savingsChoice: "Week",
          date: DateFormat('dd/MM/yy').format(DateTime(
            widget.goal.startDate.year,
            widget.goal.startDate.month,
            widget.goal.startDate.day + 7 * (i - 1),
          )),
          weeklyOrMonthlydeposit:
              (widget.goal.savingsType == SavingsType.constant)
                  ? widget.goal.initialDeposit
                  : widget.goal.initialDeposit * i,
        ));
      }
    } else {
      for (int i = 1; i < 13; i++) {
        remainingWeeksorMonths.add(WeekOrMonthModel(
          completed: false,
          currentWeekOrMonth: i,
          savingsChoice: "Month",
          date: DateFormat('dd/MM/yy').format(DateTime(
            widget.goal.startDate.year,
            widget.goal.startDate.month,
            widget.goal.startDate.day + 7 * (i - 1),
          )),
          weeklyOrMonthlydeposit:
              (widget.goal.savingsType == SavingsType.constant)
                  ? widget.goal.initialDeposit
                  : widget.goal.initialDeposit * i,
        ));
      }
    }
    return remainingWeeksorMonths;
  }

  List<WeekOrMonthModel> getUpcomingWeekOrMonth() {
    return upcomingWeekorMonth;
  }

  List<WeekOrMonthModel> completedWeekOrMonth() {
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
          if (element is GoalProgressModel) {
            return GoalProgress(
              goalProgressModel: element,
            );
          } else if (element is String) {
            return TextCard(
              text: element,
            );
          } else if (element is WeekOrMonthModel) {
            return WeekOrMonthCard(
              weekOrMonthModel: element,
              onTapped: () {
                setState(() {
                  element.completed = true;
                  widget.goal.upcomingWeekOrMonth++;
                  Timer.periodic(const Duration(seconds: 5), (timer) {});
                });
              },
            );
          } else {
            return const Text("Null");
          }
        }),
      ),
    );
  }

  List<dynamic> prepareListItems() {
    listItems.add(
      GoalProgressModel(
        percent: goal.getPercent(),
        totalDepositedAmt: goal.getTotalDepositedAmt(),
        savings: goal.savings,
      ),
    );
    listItems.add("Upcoming Deposit");
    listItems.addAll(getUpcomingWeekOrMonth());
    listItems.add("All Deposit");
    listItems.addAll(completedWeeksorMonths);
    listItems.addAll(remainingWeeksorMonths);
    return listItems;
  }
}
