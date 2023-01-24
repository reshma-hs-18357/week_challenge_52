import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';

class SelectGoalType extends StatefulWidget {
  final bool back;
  final Goal goal;
  final void Function(SavingsType savingsType) onSelect;
  const SelectGoalType({
    super.key,
    required this.goal,
    required this.onSelect,
    required this.back,
  });

  @override
  State<SelectGoalType> createState() => _SelectGoalTypeState();
}

class _SelectGoalTypeState extends State<SelectGoalType> {
  SavingsType? selectType;
  @override
  void initState() {
    if (widget.back == true) {
      if (widget.goal.savingsType == SavingsType.constant) {
        setState(() {
          selectType = SavingsType.constant;
        });
      } else {
        setState(() {
          selectType = SavingsType.progressive;
        });
      }
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
            "How do you want to save your money each week?",
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
                    selectType = SavingsType.progressive;
                    widget.onSelect(SavingsType.progressive);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: selectType != SavingsType.progressive
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  child: Container(
                    height: 141,
                    width: 150,
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
                              color: selectType != SavingsType.progressive
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
                              color: selectType != SavingsType.progressive
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
                    selectType = SavingsType.constant;
                    widget.onSelect(SavingsType.constant);
                  });
                },
                child: Card(
                  color: selectType != SavingsType.constant
                      ? Colors.white
                      : const Color.fromRGBO(77, 182, 77, 1),
                  elevation: 10,
                  child: Container(
                    height: 141,
                    width: 150,
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
                              color: selectType != SavingsType.constant
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
                              color: selectType != SavingsType.constant
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
