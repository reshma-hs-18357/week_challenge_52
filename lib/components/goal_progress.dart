import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:week_challenge_52/models/goal_progress_model.dart';

class GoalProgress extends StatefulWidget {
  final GoalProgressModel goalProgressModel;
  const GoalProgress({
    super.key,
    required this.goalProgressModel,
  });

  @override
  State<GoalProgress> createState() => _GoalProgressState();
}

class _GoalProgressState extends State<GoalProgress> {
  static Color green = const Color.fromRGBO(16, 159, 40, 1);
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
              animation: true,
              lineWidth: 15.0,
              percent: widget.goalProgressModel.percent,
              arcBackgroundColor: widget.goalProgressModel.percent < 1
                  ? const Color.fromRGBO(217, 217, 217, 1)
                  : green,
              arcType: ArcType.FULL,
              circularStrokeCap: CircularStrokeCap.butt,
              progressColor: green,
              restartAnimation: true,
              animationDuration: 1000,
            ),
          ),
          Positioned(
            top: 120,
            left: 85,
            right: 85,
            child: Center(
              child: Text(
                "${widget.goalProgressModel.getPercentValue()} %",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
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
                "${widget.goalProgressModel.totalDepositedAmt} of Rs.${widget.goalProgressModel.savings}",
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
              "${widget.goalProgressModel.getPercentValue()} %",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
