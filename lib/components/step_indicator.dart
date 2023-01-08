import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StepIndicator extends StatelessWidget {
  int step;
  StepIndicator({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 286, 6),
          child: Text(
            "Step $step of 4",
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          width: 102,
          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
          progressColor: const Color.fromRGBO(77, 182, 77, 1),
          animateFromLastPercent: true,
          percent: step / 4,
          barRadius: const Radius.circular(10),
        )
      ],
    );
  }
}
