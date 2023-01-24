import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  final void Function(Goal goal) onCardTapped;
  const GoalCard({
    super.key,
    required this.goal,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    String endDateString = DateFormat('dd MMM yyyy').format(goal.getEndDate());
    return GestureDetector(
      onTap: () {
        onCardTapped(goal);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goal.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    UnconstrainedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (goal.savingsChoiceText() == "Weekly")
                              ? const Color.fromRGBO(221, 255, 221, 1)
                              : const Color.fromRGBO(252, 215, 226, 1),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(9, 3, 9, 3),
                            child: Text(
                              goal.savingsChoiceText(),
                              style: TextStyle(
                                fontSize: 12,
                                color: (goal.savingsChoiceText() == "Weekly")
                                    ? const Color.fromRGBO(94, 178, 93, 1)
                                    : const Color.fromRGBO(227, 93, 133, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                child: Text(
                  "Rs.${goal.getTotalSavings()}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 20,
                backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                progressColor: const Color.fromRGBO(77, 182, 77, 1),
                animateFromLastPercent: true,
                percent: goal.getPercent(),
                barRadius: const Radius.circular(10),
                center: Row(
                  children: [
                    const Spacer(),
                    Text(
                      "${(goal.getPercent() * 100).toInt()}%",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),
                child: Text(
                  "Rs.${goal.getTotalDepositedAmt()} of Rs.${goal.getTotalSavings()}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${goal.getRemainingWeeksOrMonths()} left",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                    Text(
                      "Ends: $endDateString",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
