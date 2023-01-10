// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';

class SelectGoalType extends StatefulWidget {
  Goal goal;
  void Function(SavingsType savingsType) onSelect;
  SelectGoalType({super.key, required this.goal, required this.onSelect});

  @override
  State<SelectGoalType> createState() => _SelectGoalTypeState();
}

class _SelectGoalTypeState extends State<SelectGoalType> {
  late int progressive;
  late int constant;
  @override
  void initState() {
    progressive = -1;
    constant = -1;
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
                    constant = -1;
                    widget.onSelect(SavingsType.progressive);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: progressive == -1
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  child: Container(
                    height: 141,
                    width: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
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
                              color: progressive == -1
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
                              color: progressive == -1
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
                    progressive = -1;
                    widget.onSelect(SavingsType.constant);
                  });
                },
                child: Card(
                  color: constant == -1
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  elevation: 10,
                  child: Container(
                    height: 141,
                    width: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
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
                              color: constant == -1
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
                              color: constant == -1
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
