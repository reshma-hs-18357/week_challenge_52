// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NextButtonComponent extends StatelessWidget {
  int index;
  bool isButtonEnabled;
  void Function() onPressed;
  NextButtonComponent(
      {Key? key,
      required this.onPressed,
      required this.index,
      required this.isButtonEnabled})
      : super(key: key);

  TextStyle textStyle() {
    return const TextStyle(fontSize: 14);
  }

  TextButton textButton() {
    return TextButton(
      onPressed: (isButtonEnabled) ? onPressed : () {},
      style: ButtonStyle(
        backgroundColor: (isButtonEnabled == true)
            ? MaterialStateProperty.all(const Color.fromRGBO(21, 131, 36, 1))
            : MaterialStateProperty.all(const Color.fromRGBO(217, 217, 217, 1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "Next",
          style: TextStyle(
              fontSize: 18,
              color: (isButtonEnabled == true)
                  ? Colors.white
                  : const Color.fromRGBO(102, 102, 102, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 140,
      child: textButton(),
    );
  }
}
