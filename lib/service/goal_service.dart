import 'package:week_challenge_52/models/goal.dart';

class GoalService {
  static GoalService instance = GoalService._initInstance();
  List<Goal> goalList = [];

  void postGoals(Goal goal) {
    goalList.add(goal);
  }

  GoalService._initInstance();

  List<Goal> fetchGoalList() {
    return goalList;
  }

  void addingGoals() {
    Goal goal1 = Goal(
        id: 1,
        name: "weekconstant",
        savingsChoice: SavingsChoice.weekly,
        savingsType: SavingsType.constant,
        initialDeposit: 100.0,
        savings: 0,
        startDate: DateTime.now(),
        completedWeekOrMonth: 20);
    postGoals(goal1);
    Goal goal2 = Goal(
        id: 1,
        name: "weekprogressive",
        savingsChoice: SavingsChoice.weekly,
        savingsType: SavingsType.progressive,
        initialDeposit: 100.0,
        savings: 0,
        startDate: DateTime.now(),
        completedWeekOrMonth: 10);
    postGoals(goal2);
    Goal goal3 = Goal(
        id: 1,
        name: "monthconstant",
        savingsChoice: SavingsChoice.monthly,
        savingsType: SavingsType.constant,
        initialDeposit: 100.0,
        savings: 0,
        startDate: DateTime.now(),
        completedWeekOrMonth: 5);
    postGoals(goal3);
    Goal goal4 = Goal(
        id: 1,
        name: "monthprogressive",
        savingsChoice: SavingsChoice.monthly,
        savingsType: SavingsType.progressive,
        initialDeposit: 100.0,
        savings: 0,
        startDate: DateTime.now(),
        completedWeekOrMonth: 0);
    postGoals(goal4);
  }
}
