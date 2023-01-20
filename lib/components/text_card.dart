import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String text;
  final void Function() onExpanding;
  final bool isOpen;
  const TextCard(
      {super.key,
      required this.text,
      required this.onExpanding,
      required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
      child: Container(
        color: const Color.fromRGBO(242, 239, 248, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
              const Spacer(),
              (text == "Upcoming Deposit")
                  ? const Text("")
                  : IconButton(
                      icon: (isOpen == true)
                          ? const Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 30,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            )
                          : const Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 30,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                      onPressed: onExpanding,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
