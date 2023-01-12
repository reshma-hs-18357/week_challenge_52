// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';

class SelectGoalType extends StatefulWidget {
  bool back;
  Goal goal;
  void Function(SavingsType savingsType) onSelect;
  SelectGoalType({
    super.key,
    required this.goal,
    required this.onSelect,
    required this.back,
  });

  @override
  State<SelectGoalType> createState() => _SelectGoalTypeState();
}

class _SelectGoalTypeState extends State<SelectGoalType> {
  late int progressive;
  late int constant;
  @override
  void initState() {
    if (widget.back == true) {
      if (widget.goal.savingsType == SavingsType.constant) {
        setState(() {
          constant = 1;
          progressive = 0;
        });
      } else {
        setState(() {
          progressive = 1;
          constant = 0;
        });
      }
    } else {
      progressive = 0;
      constant = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How do you want to save your money each week",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    progressive = 1;
                    constant = 0;
                    widget.onSelect(SavingsType.progressive);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: progressive == 0
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  child: Container(
                    height: 141,
                    width: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Progressive",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: progressive == 0
                                  ? const Color.fromRGBO(85, 85, 85, 1)
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            (widget.goal.savingsChoiceText() == "Weekly")
                                ? "The amount saved will be increased every week"
                                : "The amount saved will be increased every month",
                            style: TextStyle(
                              fontSize: 14,
                              color: progressive == 0
                                  ? const Color.fromRGBO(102, 102, 102, 1)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    constant = 1;
                    progressive = 0;
                    widget.onSelect(SavingsType.constant);
                  });
                },
                child: Card(
                  color: constant == 0
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  elevation: 10,
                  child: Container(
                    height: 141,
                    width: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Constant",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: constant == 0
                                  ? const Color.fromRGBO(85, 85, 85, 1)
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            (widget.goal.savingsChoiceText() == "Weekly")
                                ? "The amount saved will be the same over the weeks"
                                : "The amount saved will be the same over the months",
                            style: TextStyle(
                              fontSize: 14,
                              color: constant == 0
                                  ? const Color.fromRGBO(102, 102, 102, 1)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
