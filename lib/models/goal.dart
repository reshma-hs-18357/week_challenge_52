class Goal {
  int? id;
  String name;
  SavingsChoice savingsChoice;
  SavingsType savingsType;
  double initialDeposit;
  double savings;
  DateTime startDate;
  int upcomingWeekOrMonth;

  Goal({
    this.id,
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
    return "Name: $name, id: $id, savings Choice: ${savingsChoiceText()}, savings type: ${savingsTypeText()}, initial deposit: $initialDeposit, savings: $savings, start date: $startDate";
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

  double getAmt(int weekormonth) {
    if (savingsType == SavingsType.constant) {
      savings = weekormonth * initialDeposit;
      return savings;
    } else {
      savings = weekormonth /
          2 *
          (2 * initialDeposit + (weekormonth - 1) * initialDeposit);
      return savings;
    }
  }

  double getTotalSavings() {
    int weekormonth;
    if (savingsChoice == SavingsChoice.weekly) {
      weekormonth = 52;
    } else {
      weekormonth = 12;
    }
    return getAmt(weekormonth);
  }

  double getTotalDepositedAmt() {
    return getAmt(upcomingWeekOrMonth);
  }

  double getFinalDeposit() {
    if (savingsChoice == SavingsChoice.weekly) {
      if (savingsType == SavingsType.constant) {
        return initialDeposit;
      } else {
        return 52 * initialDeposit;
      }
    } else {
      if (savingsType == SavingsType.constant) {
        return initialDeposit;
      } else {
        return 12 * initialDeposit;
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
