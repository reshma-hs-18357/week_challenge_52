class GoalCardModel {
  String name;
  String savingsChoiceText;
  double savings;
  double percent;
  String remainingWeekOrMonth;
  DateTime endDate;
  double totalAmtDeposited;
  GoalCardModel({
    required this.name,
    required this.savingsChoiceText,
    required this.savings,
    required this.percent,
    required this.remainingWeekOrMonth,
    required this.endDate,
    required this.totalAmtDeposited,
  });
  int getPercentValue() {
    return (percent * 100).toInt();
  }
}
