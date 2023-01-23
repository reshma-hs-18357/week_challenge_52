// import 'package:flutter/material.dart';
// import 'package:week_challenge_52/components/goal_card.dart';
// import 'package:week_challenge_52/components/title_card.dart';
// import 'package:week_challenge_52/models/goal.dart';
// import 'package:week_challenge_52/screens/home_screen.dart';

// class GoalsScreen extends StatelessWidget {
//   final List<Goal> goalList;
//   final void Function(Goal goal) onCardTapped;
//   final Filter filter;
//   const GoalsScreen({
//     super.key,
//     required this.goalList,
//     required this.onCardTapped,
//     required this.filter,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return _goalScreenBody();
//   }

//   Widget _goalScreenBody() {
//     if (goalList.isEmpty) {
//       return Column(
//         children: [
//           const SizedBox(height: 60),
//           SizedBox(
//               height: 251,
//               width: 210,
//               child: Image.asset('assets/images/money.png',
//                   fit: BoxFit.fitHeight)),
//           const Padding(
//             padding: EdgeInsets.fromLTRB(53, 30, 53, 16),
//             child: SizedBox(
//               height: 60,
//               width: 269,
//               child: Text(
//                 "Oops! You have no registered goals",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
//             child: Text("Add new goals using the button(+)"),
//           )
//         ],
//       );
//     } else {
//       if (filter == Filter.all) {
//         List<dynamic> listItems = _prepareListItems();
//         return ListView.builder(
//           itemCount: listItems.length,
//           itemBuilder: ((context, index) {
//             var element = listItems[index];
//             if (element is String) {
//               return TitleCard(title: element);
//             } else {
//               Goal goal = listItems[index];
//               return GoalCard(
//                 goal: goal,
//                 onCardTapped: onCardTapped,
//               );
//             }
//           }),
//         );
//       } else {
//         return ListView.builder(
//           itemCount: goalList.length,
//           itemBuilder: ((context, index) {
//             Goal goal = goalList[index];
//             return GoalCard(
//               goal: goal,
//               onCardTapped: onCardTapped,
//             );
//           }),
//         );
//       }
//     }
//   }

//   List<dynamic> _prepareListItems() {
//     List<dynamic> listItems = [];
//     List<Goal> weeklyGoals = [];
//     List<Goal> monthlyGoals = [];
//     for (int i = 0; i < goalList.length; i++) {
//       if (goalList[i].savingsChoice == SavingsChoice.weekly) {
//         weeklyGoals.add(goalList[i]);
//       } else {
//         monthlyGoals.add(goalList[i]);
//       }
//     }
//     listItems.add("Weekly Goals");
//     listItems.addAll(weeklyGoals);
//     listItems.add("Monthly Goals");
//     listItems.addAll(monthlyGoals);
//     return listItems;
//   }
// }
