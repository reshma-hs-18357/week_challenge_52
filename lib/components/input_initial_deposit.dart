import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/components/savings_card.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputInitialDeposit extends StatefulWidget {
  final bool back;
  final Goal goal;
  final void Function(double initialDeposit) onInput;
  const InputInitialDeposit({
    super.key,
    required this.goal,
    required this.onInput,
    required this.back,
  });

  @override
  State<InputInitialDeposit> createState() => _InputInitialDepositState();
}

class _InputInitialDepositState extends State<InputInitialDeposit> {
  TextEditingController initialDepositCntrl = TextEditingController();
  late Goal goal;

  @override
  void initState() {
    goal = widget.goal;
    goal.savings = 0.0;
    if (widget.back == true) {
      initialDepositCntrl.text = widget.goal.initialDeposit.toString();
    } else {
      initialDepositCntrl.text = "";
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
          HeadingComponent(
              title:
                  "How much do you want to save per ${goal.savingsChoiceText().toLowerCase().split('ly').first} ?"),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: TextField(
              controller: initialDepositCntrl,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                labelText: 'Rs.100 is already a good start',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double initialDeposit = double.parse(value);
                  widget.onInput(initialDeposit);
                } else {
                  widget.onInput(0);
                }
              },
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 14),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
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
      ${goal.savingsChoiceText().toLowerCase().split('ly').first}s ''',
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SavingsCard(savings: goal.savings)
        ],
      ),
    );
  }
}
