class GoalProgressModel {
  double totalDepositedAmt;
  double savings;

  GoalProgressModel({required this.totalDepositedAmt, required this.savings});

  double getPercent() {
    return totalDepositedAmt / savings;
  }
}
