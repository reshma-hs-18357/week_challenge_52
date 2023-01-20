import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StepIndicator extends StatelessWidget {
  final int step;
  const StepIndicator({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 28, 6),
          child: Text(
            "Step $step of 4",
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: LinearPercentIndicator(
            lineHeight: 10,
            width: 102,
            backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
            progressColor: const Color.fromRGBO(77, 182, 77, 1),
            animateFromLastPercent: true,
            percent: step / 4,
            barRadius: const Radius.circular(10),
          ),
        )
      ],
    );
  }
}
