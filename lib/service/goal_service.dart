import 'package:week_challenge_52/models/goal.dart';

class GoalService {
  static GoalService instance = GoalService._initInstance();
  List<Goal> goalList = [];
  GoalService._initInstance();

  void postGoals(Goal goal) {
    goalList.add(goal);
  }

  List<Goal> fetchGoalList() {
    return goalList;
  }
}
