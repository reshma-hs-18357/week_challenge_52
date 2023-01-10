// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputGoalName extends StatefulWidget {
  Goal goal;
  void Function(String value) isValid;
  InputGoalName({super.key, required this.goal, required this.isValid});

  @override
  State<InputGoalName> createState() => _InputGoalNameState();
}

class _InputGoalNameState extends State<InputGoalName> {
  TextEditingController goalName = TextEditingController();

  @override
  void initState() {
    goalName.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingComponent(title: "What is your next goal ?"),
          const SizedBox(height: 10),
          const Text(
            "What do you want to achieve? it is always good to give names to our objectives",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 48,
            child: TextField(
              controller: goalName,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                labelText: 'Ex.Travel to Japan',
              ),
              onChanged: (value) {
                widget.isValid(value);
              },
              keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }
}
