import 'package:flutter/material.dart';

class InputGoalName extends StatelessWidget {
  const InputGoalName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What is your next goal ?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Text(
            "What do you want to achieve? it is always good to give names to our objectives",
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                labelText: 'Ex.Travel to Japan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
