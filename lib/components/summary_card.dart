// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:intl/intl.dart';

class SummaryCard extends StatelessWidget {
  Goal goal;
  void Function() onStartButtonTapped;
  SummaryCard(
      {super.key, required this.goal, required this.onStartButtonTapped});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    String currentDay = DateFormat('EEEE').format(date);
    String startDateString = DateFormat('dd/MM/yyyy').format(goal.startDate);
    String endDateString = DateFormat('dd/MM/yyyy').format(goal.getEndDate());
    double getFinalDeposit() {
      if (goal.savingsChoice == SavingsChoice.weekly) {
        if (goal.savingsType == SavingsType.constant) {
          return goal.initialDeposit;
        } else {
          return 52 * goal.initialDeposit;
        }
      } else {
        if (goal.savingsType == SavingsType.constant) {
          return goal.initialDeposit;
        } else {
          return 12 * goal.initialDeposit;
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingComponent(title: "Summary of your challenge"),
          const SizedBox(height: 16),
          Card(
            elevation: 10,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "To reach your goal...",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    goal.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "You will have save a weekly amount of",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            (goal.savingsChoiceText() == "Weekly")
                                ? "Week 1"
                                : "Month 1",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            startDateString,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text('Rs. ${goal.initialDeposit}')
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: const [
                          Text(
                            "to",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          Text(
                            (goal.savingsChoiceText() == "Weekly")
                                ? "Week 52"
                                : "Month 12",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            endDateString,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text('${getFinalDeposit()}'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentDay,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "at",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "09:00 am",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "At the end of you challenge you will be saved",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${goal.getTotalSavings()}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 50,
            child: TextButton(
              onPressed: onStartButtonTapped,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(21, 131, 36, 1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
