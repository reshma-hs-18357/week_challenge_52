import 'dart:math';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/service/goal_service.dart';

class DashboardCalulations {
  GoalService goalService = GoalService.instance;
  List<Goal> goalList = [];

  double overallSavings() {
    double overallSavings = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      overallSavings += goal.getTotalSavings();
    }
    return overallSavings;
  }

  double overallDeposit() {
    double overallDeposit = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      overallDeposit += goal.getTotalDepositedAmt();
    }
    return overallDeposit;
  }

  double overallMonthlyDeposit() {
    double overallMonthlyDeposit = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      if (goal.savingsChoice == SavingsChoice.monthly) {
        overallMonthlyDeposit += goal.getTotalDepositedAmt();
      }
    }
    return overallMonthlyDeposit;
  }

  double overallWeeklyDeposit() {
    return overallDeposit() - overallMonthlyDeposit();
  }

  int totalGoalCount() {
    goalList = goalService.fetchGoalList();
    return goalList.length;
  }

  int completedGoalCount() {
    int completedGoalcount = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      if (goal.getPercent() == 1) {
        completedGoalcount += 1;
      }
    }
    return completedGoalcount;
  }

  int totalMonthlyGoalCount() {
    int totalMonthlyGoalCount = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      if (goal.savingsChoice == SavingsChoice.monthly) {
        totalMonthlyGoalCount += 1;
      }
    }
    return totalMonthlyGoalCount;
  }

  int totalWeeklyGoalCount() {
    return totalGoalCount() - totalMonthlyGoalCount();
  }

  int completedMonthlyGoalCount() {
    int completedMonthlyGoalCount = 0;
    goalList = goalService.fetchGoalList();
    for (Goal goal in goalList) {
      if (goal.getPercent() == 1 &&
          goal.savingsChoice == SavingsChoice.monthly) {
        completedMonthlyGoalCount += 1;
      }
    }
    return completedMonthlyGoalCount;
  }

  int completedWeeklyGoalCount() {
    return completedGoalCount() - completedMonthlyGoalCount();
  }

  String randomQuote() {
    List<String> quotes = [];
    quotes.add("The journey of a thousand miles begins with one step");
    quotes.add("We design our lives through the power of choices");
    quotes.add("The future belongs to those who prepare for it today");
    quotes.add(
        "The more your money works for you, the less you have to work for money");
    quotes.add(
        "You don’t have to see the whole staircase, just take the first step");
    quotes.add(
        "A budget is telling your money where to go instead of wondering where it went");
    quotes.add(
        "Small amounts saved daily add up to huge investments in the end.");
    quotes.add("Know what you own, and know why you own it");
    quotes.add(
        "Do not save what is left after spending, but spend what is left after saving");
    quotes.add(
        "The habit of saving is itself an education; it fosters every virtue, teaches self-denial, cultivates the sense of order, trains to forethought, and so broadens the mind");
    final random = Random();
    var element = quotes[random.nextInt(quotes.length)];
    return element;
  }
}
