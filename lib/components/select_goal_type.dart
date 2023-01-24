import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/goal_type_card.dart';
import 'package:week_challenge_52/components/heading_component.dart';
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
  late Goal goal;

  @override
  void initState() {
    goal = widget.goal;
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
          const HeadingComponent(
            title: "How do you want to save your money each week ?",
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
                  child: GoalTypeCard(
                    savingsChoice: goal.savingsChoice,
                    title: "Progressive",
                    selectType: selectType,
                    isSelected: selectType == SavingsType.progressive,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectType = SavingsType.constant;
                    widget.onSelect(SavingsType.constant);
                  });
                },
                child: GoalTypeCard(
                  savingsChoice: goal.savingsChoice,
                  title: "Constant",
                  selectType: selectType,
                  isSelected: selectType == SavingsType.constant,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
