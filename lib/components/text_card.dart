// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  String text;
  TextCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
      child: Container(
        color: const Color.fromRGBO(242, 239, 248, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(102, 102, 102, 1))),
        ),
      ),
    );
  }
}
