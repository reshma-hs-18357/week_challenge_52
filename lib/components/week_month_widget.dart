// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/week_month_model.dart';

class WeekMonthWidget extends StatelessWidget {
  WeekMonthModel model;
  void Function() onTapped;
  WeekMonthWidget({
    required this.model,
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
              icon: model.completed
                  ? Icon(Icons.circle_rounded)
                  : Icon(Icons.circle_outlined),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  model.date,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                )
              ],
            ),
            const Spacer(),
            Text(
              '${model.amount}',
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
