// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/week_month_model.dart';

class WeekOrMonthCard extends StatelessWidget {
  WeekOrMonthModel weekOrMonthModel;
  void Function() onTapped;
  WeekOrMonthCard({
    required this.weekOrMonthModel,
    required this.onTapped,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(
              onPressed: onTapped,
              icon: weekOrMonthModel.completed
                  ? const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 40,
                      color: Color.fromRGBO(16, 159, 40, 1),
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      size: 40,
                      color: Color.fromRGBO(16, 159, 40, 1),
                    ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  "${weekOrMonthModel.savingsChoice} ${weekOrMonthModel.currentWeekOrMonth}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  weekOrMonthModel.date,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              '${weekOrMonthModel.weeklyOrMonthlydeposit}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
