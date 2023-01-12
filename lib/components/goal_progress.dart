// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:week_challenge_52/models/goal.dart';

class GoalProgress extends StatelessWidget {
  Goal goal;
  GoalProgress({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 357,
      child: Stack(
        children: [
          Positioned(
            top: 32,
            left: 51,
            right: 50,
            child: CircularPercentIndicator(
              radius: 120.0,
              animateFromLastPercent: true,
              lineWidth: 15.0,
              percent: goal.getPercent(),
              arcBackgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              arcType: ArcType.FULL,
              circularStrokeCap: CircularStrokeCap.butt,
              progressColor: const Color.fromRGBO(16, 159, 40, 1),
            ),
          ),
          Positioned(
            top: 120,
            left: 85,
            right: 85,
            child: Center(
              child: Text(
                "${(goal.getPercent() * 100).toInt()} %",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(16, 159, 40, 1)),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 80,
            right: 80,
            bottom: 105,
            child: Center(
              child: Text(
                "${goal.getTotalDepositedAmt()} of Rs.${goal.getTotalSavings()}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 85,
            child: Text(
              "${(goal.getPercent() * 100).toInt()} %",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Positioned(
            top: 250,
            right: 80,
            child: Text(
              "100%",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
