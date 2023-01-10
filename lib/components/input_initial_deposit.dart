// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputInitialDeposit extends StatelessWidget {
  Goal goal;
  void Function(double initialDeposit) onInput;
  InputInitialDeposit({super.key, required this.goal, required this.onInput});

  String getSavingsChoice() {
    if (goal.savingsChoiceText() == "Weekly") {
      return "weeks";
    } else {
      return "months";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HeadingComponent(title: "How much do you want to save per week?"),
        const SizedBox(height: 24),
        SizedBox(
          height: 48,
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
              labelText: 'Rs.100 is already a good start',
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                double initialDeposit = double.parse(value);
                onInput(initialDeposit);
              }
            },
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 14),
        RichText(
          text: TextSpan(
            style: const TextStyle(
                fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                ),
              ),
              const TextSpan(
                text: " ",
              ),
              TextSpan(
                text:
                    '''The chosen values will be ${goal.savingsTypeText().toLowerCase()} over the 
     ${getSavingsChoice()}''',
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 10,
          child: Container(
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/trophy.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '''At the end of the challenge you
             will have saved''',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          (goal.getTotalSavings() == 0.0)
                              ? '-'
                              : '${goal.getTotalSavings()}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )),
          ),
        )
      ]),
    );
  }
}
