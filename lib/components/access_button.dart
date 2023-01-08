// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class AccessButton extends StatelessWidget {
  String title;
  void Function() onPressed;
  AccessButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  TextStyle textStyle() {
    return const TextStyle(fontSize: 14);
  }

  TextButton textButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            (title == "Back") ? null : const Color.fromRGBO(21, 131, 36, 1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
              color: ((title == "Back")
                  ? const Color.fromRGBO(21, 131, 36, 1)
                  : const Color.fromRGBO(217, 217, 217, 1)),
            ),
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              color: (title == "Back")
                  ? const Color.fromRGBO(21, 131, 36, 1)
                  : const Color.fromARGB(255, 255, 255, 255)),
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
