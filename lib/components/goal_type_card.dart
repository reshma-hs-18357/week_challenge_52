import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';

class GoalTypeCard extends StatelessWidget {
  final SavingsType? selectType;
  final String title;
  final SavingsChoice savingsChoice;
  final bool isSelected;

  const GoalTypeCard({
    super.key,
    required this.savingsChoice,
    required this.selectType,
    required this.title,
    required this.isSelected,
  });

  String subtitle() {
    if (savingsChoice == SavingsChoice.weekly) {
      if (title == "Progressive") {
        return "The amount saved will be increased every week";
      } else {
        return "The amount saved will be same every week";
      }
    } else {
      if (title == "Progressive") {
        return "The amount saved will be increased every month";
      } else {
        return "The amount saved will be same every month";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isSelected ? const Color.fromRGBO(77, 182, 77, 1) : Colors.white,
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
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromRGBO(85, 85, 85, 1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle(),
                style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? Colors.white
                        : const Color.fromRGBO(102, 102, 102, 1)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
