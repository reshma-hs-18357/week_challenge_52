import 'package:flutter/material.dart';

class GoalChoiceCard extends StatelessWidget {
  final String title;
  const GoalChoiceCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: (title == "Weekly")
          ? Colors.white
          : const Color.fromRGBO(77, 182, 77, 1),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 150),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: (title == "Weekly" ? Colors.black : Colors.white),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 4, 16),
                child: SizedBox(
                  height: 60,
                  width: 202,
                  child: Text(
                    (title == "Weekly")
                        ? "Save every week, for 52 weeks, an amount determined by you"
                        : "Save every month, for 12 months, an amount determined by you",
                    style: TextStyle(
                      color: (title == "Weekly" ? Colors.black : Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          title == "Weekly"
              ? Image.asset(
                  'assets/images/money2.png',
                  height: 136,
                  width: 95,
                  fit: BoxFit.fitHeight,
                )
              : Image.asset(
                  'assets/images/money3.png',
                  height: 130,
                  width: 88,
                  fit: BoxFit.fitHeight,
                ),
        ],
      ),
    );
  }
}
