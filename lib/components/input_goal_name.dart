import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputGoalName extends StatefulWidget {
  final Goal goal;
  final bool back;
  final void Function(String value) isValid;
  const InputGoalName(
      {super.key,
      required this.goal,
      required this.isValid,
      required this.back});

  @override
  State<InputGoalName> createState() => _InputGoalNameState();
}

class _InputGoalNameState extends State<InputGoalName> {
  TextEditingController goalNameCntrl = TextEditingController();

  @override
  void initState() {
    if (widget.back == true) {
      goalNameCntrl.text = widget.goal.name;
    } else {
      goalNameCntrl.text = "";
    }
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
              controller: goalNameCntrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(21, 131, 36, 1))),
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
