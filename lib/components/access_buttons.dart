import 'package:flutter/material.dart';
import 'package:week_challenge_52/screens/goals_screen.dart';

class AccessButton extends StatelessWidget {
  final AccessButtonsEnum accessButton;
  final int index;
  final bool? isButtonEnabled;
  final void Function() onPressed;
  const AccessButton({
    super.key,
    required this.onPressed,
    required this.index,
    this.isButtonEnabled,
    required this.accessButton,
  });

  TextButton textButton() {
    if (accessButton == AccessButtonsEnum.next) {
      return TextButton(
        onPressed: (isButtonEnabled!) ? onPressed : () {},
        style: ButtonStyle(
          backgroundColor: (isButtonEnabled == true)
              ? MaterialStateProperty.all(const Color.fromRGBO(21, 131, 36, 1))
              : MaterialStateProperty.all(
                  const Color.fromRGBO(217, 217, 217, 1)),
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
                  : const Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(242, 239, 248, 1),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(
                color: (index != 0)
                    ? const Color.fromRGBO(21, 131, 36, 1)
                    : const Color.fromRGBO(242, 239, 248, 1),
              ),
            ),
          ),
        ),
        child: const Center(
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 18,
              color: (Color.fromRGBO(21, 131, 36, 1)),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 158,
      child: textButton(),
    );
  }
}
