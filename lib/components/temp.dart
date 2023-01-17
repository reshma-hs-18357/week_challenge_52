// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/models/goal_card_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalCardTemp extends StatelessWidget {
  GoalCardModel goalCardModel;
  void Function() onTapped;
  GoalCardTemp(
      {super.key, required this.goalCardModel, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    String endDateString =
        DateFormat('dd MMM yyyy').format(goalCardModel.endDate);
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
        child: Card(
          elevation: 10,
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
                      goalCardModel.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: (goalCardModel.savingsChoiceText == "Weekly")
                          ? 52
                          : 58,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (goalCardModel.savingsChoiceText == "Weekly")
                            ? const Color.fromRGBO(221, 255, 221, 1)
                            : const Color.fromRGBO(252, 215, 226, 1),
                      ),
                      child: Center(
                        child: Text(
                          goalCardModel.savingsChoiceText,
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  (goalCardModel.savingsChoiceText == "Weekly")
                                      ? const Color.fromRGBO(94, 178, 93, 1)
                                      : const Color.fromRGBO(227, 93, 133, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                child: Text(
                  '${goalCardModel.savings}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 20,
                backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                progressColor: const Color.fromRGBO(77, 182, 77, 1),
                animateFromLastPercent: true,
                percent: goalCardModel.percent,
                barRadius: const Radius.circular(10),
                center: Row(
                  children: [
                    const Spacer(),
                    Text(
                      "${goalCardModel.getPercentValue()}%",
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
                  "Rs.${goalCardModel.totalAmtDeposited} of Rs.${goalCardModel.savings}",
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
                      "${goalCardModel.remainingWeekOrMonth} left",
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
