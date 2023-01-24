import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputStartDate extends StatefulWidget {
  final Goal goal;
  final void Function(DateTime value) onPick;
  const InputStartDate({
    super.key,
    required this.goal,
    required this.onPick,
  });

  @override
  State<InputStartDate> createState() => _InputStartDateState();
}

class _InputStartDateState extends State<InputStartDate> {
  TextEditingController datecntrl = TextEditingController();

  @override
  void initState() {
    widget.goal.savings = 0;
    String showDate = DateFormat('MMM dd, yyyy').format(DateTime.now());
    datecntrl.text = showDate;
    super.initState();
  }

  void _datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        datecntrl.text = formattedDate;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingComponent(
              title: "From when do you want to start saving?"),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: TextField(
              keyboardType: TextInputType.none,
              controller: datecntrl,
              decoration: InputDecoration(
                focusColor: const Color.fromRGBO(21, 131, 36, 1),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                label: const Text('Select a date'),
              ),
              onTap: _datePicker,
            ),
          ),
        ],
      ),
    );
  }
}
