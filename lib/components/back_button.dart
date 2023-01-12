// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class BackButtonComponent extends StatelessWidget {
  int index;
  void Function() onPressed;
  BackButtonComponent({Key? key, required this.onPressed, required this.index})
      : super(key: key);

  TextStyle textStyle() {
    return const TextStyle(fontSize: 14);
  }

  Container textButton() {
    return Container(
      height: 46,
      width: 161,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(242, 239, 248, 1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(
                color: (index != 0)
                    ? (const Color.fromRGBO(21, 131, 36, 1))
                    : const Color.fromRGBO(242, 239, 248, 1),
              ),
            ),
          ),
        ),
        child: const Center(
          child: Text(
            "Back",
            style: TextStyle(
                fontSize: 18, color: (Color.fromRGBO(21, 131, 36, 1))),
          ),
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
