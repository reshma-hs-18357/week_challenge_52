// ignore_for_file: non_constant_identifier_names

class Goal {
  int id;
  String name;
  SavingsChoice savingsChoice;
  SavingsType savingsType;
  double initialDeposit;
  double savings;
  String startDate;
  int currentWeekOrMonth;

  Goal(
      {required this.id,
      required this.name,
      required this.savingsChoice,
      required this.initialDeposit,
      required this.startDate,
      required this.savingsType,
      required this.savings,
      required this.currentWeekOrMonth});

  String savingsChoiceText() {
    if (savingsChoice == SavingsChoice.weekly) {
      return "Weekly";
    } else {
      return "Monthly";
    }
  }

  int getCurrentWeekOrMonth() {
    return 4;
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
        savings = 23 * (2 * initialDeposit + 51);
        return savings;
      }
    } else {
      if (savingsType == SavingsType.constant) {
        savings = 12 * initialDeposit;
        return savings;
      } else {
        savings = 6 * (2 * initialDeposit + 11);
        return savings;
      }
    }
  }

  double getTotalDepositedAmt() {
    savings;
    if (savingsChoice == SavingsChoice.weekly) {
      if (savingsType == SavingsType.constant) {
        savings = getCurrentWeekOrMonth() * initialDeposit;
        return savings;
      } else {
        savings = getCurrentWeekOrMonth() /
            2 *
            (2 * initialDeposit + (getCurrentWeekOrMonth() - 1));
        return savings;
      }
    } else {
      if (savingsType == SavingsType.constant) {
        savings = getCurrentWeekOrMonth() * initialDeposit;
        return savings;
      } else {
        savings = getCurrentWeekOrMonth() / 2 * (2 * initialDeposit + 11);
        return savings;
      }
    }
  }

  double getPercent() {
    return getTotalDepositedAmt() / getTotalSavings();
  }

  double getWeeklyorMonthlyDeposit() {
    if (savingsType == SavingsType.progressive) {
      return getCurrentWeekOrMonth() * initialDeposit;
    } else {
      return initialDeposit;
    }
  }

  String getRemainingWeeksOrMonths() {
    if (savingsChoice == SavingsChoice.weekly) {
      return "${52 - getCurrentWeekOrMonth()} Weeks";
    } else {
      return "${12 - getCurrentWeekOrMonth()} Months";
    }
  }
}

enum SavingsChoice { weekly, monthly }

enum SavingsType { constant, progressive }
