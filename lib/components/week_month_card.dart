// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/goal.dart';

class WeekorMonthCard extends StatelessWidget {
  Goal goal;
  int weekOrMonth;
  WeekorMonthCard({super.key, required this.goal, required this.weekOrMonth});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.circle_outlined,
                  size: 40,
                  color: Color.fromRGBO(16, 159, 40, 1),
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      "Week ${goal.getCurrentWeekOrMonth()}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    )
                  ],
                ),
                const SizedBox(width: 147),
                Text(
                  '${goal.getWeeklyorMonthlyDeposit()}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
