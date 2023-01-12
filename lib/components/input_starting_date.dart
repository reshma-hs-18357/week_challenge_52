// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:week_challenge_52/components/heading_component.dart';
import 'package:week_challenge_52/models/goal.dart';

class InputStartDate extends StatefulWidget {
  Goal goal;
  void Function(DateTime value) onPick;
  InputStartDate({super.key, required this.goal, required this.onPick});

  @override
  State<InputStartDate> createState() => _InputStartDateState();
}

class _InputStartDateState extends State<InputStartDate> {
  TextEditingController datecntrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    String showDate = DateFormat('MMM dd, yyyy').format(DateTime.now());
    datecntrl.text = showDate;
  }

  void datePicker() async {
    DateTime? pickedDate = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(primarySwatch: Colors.green),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);
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
          HeadingComponent(title: "From when do you want to start saving?"),
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
              onTap: datePicker,
            ),
          ),
        ],
      ),
    );
  }
}
