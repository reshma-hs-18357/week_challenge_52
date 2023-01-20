import 'package:flutter/material.dart';

class HeadingComponent extends StatelessWidget {
  final String title;
  const HeadingComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
