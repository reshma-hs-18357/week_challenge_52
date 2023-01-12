// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class WeekorMonthCard extends StatefulWidget {
  String date;
  double deposit;
  int weekOrMonth;
  String choice;
  void Function() onCircleIconButtonTapped;
  WeekorMonthCard({
    super.key,
    required this.weekOrMonth,
    required this.date,
    required this.deposit,
    required this.choice,
    required this.onCircleIconButtonTapped,
  });

  @override
  State<WeekorMonthCard> createState() => _WeekorMonthCardState();
}

class _WeekorMonthCardState extends State<WeekorMonthCard> {
  Widget circleIcon = const Icon(
    Icons.circle_outlined,
    size: 40,
    color: Color.fromRGBO(16, 159, 40, 1),
  );

  onCircleIconTapped() {
    setState(() {
      circleIcon = const Icon(
        Icons.circle_rounded,
        size: 40,
        color: Color.fromRGBO(16, 159, 40, 1),
      );
      widget.onCircleIconButtonTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(
              onPressed: onCircleIconTapped,
              icon: circleIcon,
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  (widget.choice == "Week")
                      ? "Week ${widget.weekOrMonth}"
                      : "Month ${widget.weekOrMonth}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.date,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                )
              ],
            ),
            const Spacer(),
            Text(
              '${widget.deposit}',
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
