import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputStartDate extends StatefulWidget {
  const InputStartDate({super.key});

  @override
  State<InputStartDate> createState() => _InputStartDateState();
}

class _InputStartDateState extends State<InputStartDate> {
  TextEditingController datecntrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    datecntrl.text = "";
  }

  void datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2024));

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('dd/mmyyyy').format(pickedDate);
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
          const Text(
            "From when do you want to start saving?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: TextField(
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
