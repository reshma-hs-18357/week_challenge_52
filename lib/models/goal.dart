// ignore_for_file: non_constant_identifier_names

import 'package:week_challenge_52/models/goal_progress_model.dart';

class Goal {
  int id;
  String name;
  SavingsChoice savingsChoice;
  SavingsType savingsType;
  double initialDeposit;
  double savings;
  DateTime startDate;
  int upcomingWeekOrMonth;

  Goal({
    required this.id,
    required this.name,
    required this.savingsChoice,
    required this.initialDeposit,
    required this.savings,
    required this.startDate,
    required this.savingsType,
    required this.upcomingWeekOrMonth,
  });

  @override
  String toString() {
    return "Name: $name, id: $id, savings Choice: ${savingsChoiceText()}, savings type: ${savingsTypeText()}, initial deposit: $initialDeposit, savings: ${getTotalSavings()}, start date: $startDate";
  }

  String savingsChoiceText() {
    if (savingsChoice == SavingsChoice.weekly) {
      return "Weekly";
    } else {
      return "Monthly";
    }
  }

  String savingsTypeText() {
    if (savingsType == SavingsType.constant) {
      return "Constant";
    } else {
      return "Progressive";
    }
  }

  double getTotalSavings() {
    double savings;
    if (savingsChoice == SavingsChoice.weekly) {
      if (savingsType == SavingsType.constant) {
        savings = 52 * initialDeposit;
        return savings;
      } else {
        savings = 26 * (2 * initialDeposit + 51 * initialDeposit);
        return savings;
      }
    } else {
      if (savingsType == SavingsType.constant) {
        savings = 12 * initialDeposit;
        return savings;
      } else {
        savings = 6 * (2 * initialDeposit + 11 * initialDeposit);
        return savings;
      }
    }
  }

  double getTotalDepositedAmt() {
    if (upcomingWeekOrMonth == 0) {
      return 0.00;
    } else {
      if (savingsChoice == SavingsChoice.weekly) {
        if (savingsType == SavingsType.constant) {
          savings = (upcomingWeekOrMonth) * initialDeposit;
          return savings;
        } else {
          savings = upcomingWeekOrMonth /
              2 *
              (2 * initialDeposit + (upcomingWeekOrMonth - 1) * initialDeposit);
          return savings;
        }
      } else {
        if (savingsType == SavingsType.constant) {
          savings = (upcomingWeekOrMonth) * initialDeposit;
          return savings;
        } else {
          savings = upcomingWeekOrMonth /
              2 *
              (2 * initialDeposit + (upcomingWeekOrMonth - 1) * initialDeposit);
          return savings;
        }
      }
    }
  }

  DateTime getEndDate() {
    // String startDateString = DateFormat('dd/MM/yyyy').format(startDate);
    return DateTime(startDate.year + 1, startDate.month, startDate.day);
  }

  double getPercent() {
    return getTotalDepositedAmt() / getTotalSavings();
  }

  double getWeeklyorMonthlyDeposit() {
    if (savingsType == SavingsType.progressive) {
      return upcomingWeekOrMonth * initialDeposit;
    } else {
      return initialDeposit;
    }
  }

  String getRemainingWeeksOrMonths() {
    if (savingsChoice == SavingsChoice.weekly) {
      return "${52 - upcomingWeekOrMonth} Weeks";
    } else {
      return "${12 - upcomingWeekOrMonth} Months";
    }
  }
}

enum SavingsChoice { weekly, monthly }

enum SavingsType { constant, progressive }
