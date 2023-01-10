import 'package:week_challenge_52/models/goal.dart';

class GoalService {
  List<Goal> goalList = [];

  void postGoals(Goal goal) {
    print(goalList);
    goalList.add(goal);
    print(goalList);
  }

  List<Goal> fetchGoalList() {
    Goal goal1 = Goal(
      id: 1,
      name: "Travel",
      savingsChoice: SavingsChoice.weekly,
      savingsType: SavingsType.constant,
      initialDeposit: 100.0,
      savings: 5200,
      startDate: DateTime.now(),
      currentWeekOrMonth: 4,
    );
    postGoals(goal1);
    Goal goal2 = Goal(
      id: 1,
      name: "Education",
      savingsChoice: SavingsChoice.monthly,
      savingsType: SavingsType.progressive,
      initialDeposit: 100.0,
      savings: 1266,
      startDate: DateTime.now(),
      currentWeekOrMonth: 4,
    );
    postGoals(goal2);
    return goalList;
  }
}
