//  unrelated_type_equality_checks, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:week_challenge_52/models/week_month_model.dart';

class WeekOrMonthCard extends StatelessWidget {
  final WeekOrMonthModel weekOrMonthModel;
  final void Function() onTapped;
  const WeekOrMonthCard({
    required this.weekOrMonthModel,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _getCardColor(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _getIconButton(),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  "${weekOrMonthModel.savingsChoice} ${weekOrMonthModel.upcomingWeekOrMonth}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getTextColor(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  weekOrMonthModel.date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _getTextColor(),
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              '${weekOrMonthModel.weeklyOrMonthlydeposit}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _getTextColor()),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }

  Color _getCardColor() {
    if (weekOrMonthModel.weekMonthModelType == WeekMonthModelType.upcoming) {
      return const Color.fromRGBO(16, 159, 40, 1);
    } else {
      return Colors.white;
    }
  }

  IconButton _getIconButton() {
    IconButton iconButton;
    switch (weekOrMonthModel.weekMonthModelType) {
      case WeekMonthModelType.completed:
        {
          iconButton = IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/completed.png",
              scale: 4,
            ),
          );
          break;
        }
      case WeekMonthModelType.upcoming:
        {
          iconButton = IconButton(
              onPressed: onTapped,
              icon: const Icon(
                Icons.circle_outlined,
                size: 40,
                color: Color.fromRGBO(16, 159, 40, 1),
              ));
          break;
        }
      case WeekMonthModelType.remaining:
        {
          iconButton = IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.lock_outlined,
              size: 40,
              color: Color.fromRGBO(190, 186, 191, 1),
            ),
          );
          break;
        }
    }
    return iconButton;
  }
  //   if (weekOrMonthModel.weekMonthModelType == WeekMonthModelType.upcoming) {
  //     return IconButton(
  //         onPressed: onTapped,
  //         icon: const Icon(
  //           Icons.circle_outlined,
  //           size: 40,
  //           color: Color.fromRGBO(16, 159, 40, 1),
  //         ));
  //   } else if (weekOrMonthModel.weekMonthModelType ==
  //       WeekMonthModelType.completed) {
  //     return IconButton(
  //       onPressed: () {},
  //       icon: Image.asset(
  //         "assets/images/completed.png",
  //         scale: 4,
  //       ),
  //     );
  //   } else {
  //     return IconButton(
  //       onPressed: () {},
  //       icon: const Icon(
  //         Icons.lock_outlined,
  //         size: 40,
  //         color: Color.fromRGBO(190, 186, 191, 1),
  //       ),
  //     );
  //   }
  // }

  Color _getTextColor() {
    if (weekOrMonthModel.weekMonthModelType == WeekMonthModelType.remaining) {
      return const Color.fromRGBO(190, 186, 191, 1);
    } else {
      return Colors.black;
    }
  }
}
