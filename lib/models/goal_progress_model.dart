class GoalProgressModel {
  double totalDepositedAmt;
  double savings;
  double percent;

  GoalProgressModel({
    required this.totalDepositedAmt,
    required this.savings,
    required this.percent,
  });

  int getPercentValue() {
    return (percent * 100).toInt();
  }
}
