// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/components/back_button.dart';
import 'package:week_challenge_52/components/input_initial_deposit.dart';
import 'package:week_challenge_52/components/input_goal_name.dart';
import 'package:week_challenge_52/components/input_starting_date.dart';
import 'package:week_challenge_52/components/next_button.dart';
import 'package:week_challenge_52/components/select_goal_type.dart';
import 'package:week_challenge_52/components/step_indicator.dart';
import 'package:week_challenge_52/components/summary_card.dart';
import 'package:week_challenge_52/models/goal.dart';

class NewGoalScreen extends StatefulWidget {
  Goal goal;
  NewGoalScreen({super.key, required this.goal});

  @override
  State<NewGoalScreen> createState() => _NewGoalScreenState();
}

class _NewGoalScreenState extends State<NewGoalScreen> {
  int index = 0;
  bool valid = false;
  late Widget comp;
  bool back = false;

  Widget _stepIndicator() {
    if (index != 4) {
      return StepIndicator(step: index + 1);
    } else {
      return const Text("");
    }
  }

  void isValid(String value) {
    if (value.length >= 3) {
      setState(() {
        valid = true;
        widget.goal.name = value;
      });
    } else {
      setState(() {
        valid = false;
      });
    }
  }

  void onSelect(SavingsType savingsType) {
    if (savingsType.index <= 1) {
      setState(() {
        valid = true;
        widget.goal.savingsType = savingsType;
      });
    } else {
      setState(() {
        valid = false;
      });
    }
  }

  void onInput(double initialDeposit) {
    if (initialDeposit > 0) {
      setState(() {
        valid = true;
        widget.goal.initialDeposit = initialDeposit;
      });
    } else {
      setState(() {
        valid = false;
      });
    }
  }

  void onPick(DateTime startDate) {
    String showDate = DateFormat('MMM dd, yyyy').format(startDate);

    if (showDate.isNotEmpty) {
      setState(() {
        valid = true;
        widget.goal.startDate = startDate;
      });
    } else {
      setState(() {
        valid = true;
      });
    }
  }

  void onStartButtonTapped() {
    Navigator.of(context).pop();
    Navigator.of(context).pop(widget.goal);
  }

  Widget returnComponents(int index, bool back) {
    if (index == 0) {
      return InputGoalName(goal: widget.goal, isValid: isValid, back: back);
    } else if (index == 1) {
      return SelectGoalType(goal: widget.goal, onSelect: onSelect, back: back);
    } else if (index == 2) {
      return InputInitialDeposit(
          goal: widget.goal, onInput: onInput, back: back);
    } else if (index == 3) {
      return InputStartDate(goal: widget.goal, onPick: onPick);
    } else if (index == 4) {
      return SummaryCard(
          goal: widget.goal, onStartButtonTapped: onStartButtonTapped);
    } else {
      return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _stepIndicator(),
              const SizedBox(height: 8),
              comp = returnComponents(index, back),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index != 4 && index != 0
                        ? BackButtonComponent(
                            onPressed: () {
                              setState(() {
                                back = true;
                                valid = true;
                                index -= 1;
                                comp = returnComponents(index, back);
                              });
                            },
                            index: index)
                        : const Text("            "),
                    index != 4
                        ? NextButtonComponent(
                            isButtonEnabled: valid,
                            index: index,
                            onPressed: () {
                              setState(() {
                                index += 1;
                                back = false;
                                comp = returnComponents(index, back);
                                valid =
                                    (index == 3 || back == true) ? true : false;
                              });
                            })
                        : const Text(""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
