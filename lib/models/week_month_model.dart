class WeekOrMonthModel {
  int upcomingWeekOrMonth;
  String savingsChoice;
  String date;
  double weeklyOrMonthlydeposit;
  WeekMonthModelType weekMonthModelType;

  WeekOrMonthModel({
    required this.upcomingWeekOrMonth,
    required this.savingsChoice,
    required this.date,
    required this.weeklyOrMonthlydeposit,
    required this.weekMonthModelType,
  });
}

enum WeekMonthModelType { upcoming, completed, remaining }
