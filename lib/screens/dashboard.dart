import 'package:flutter/material.dart';
import 'package:week_challenge_52/components/dashboard_card1.dart';
import 'package:week_challenge_52/components/dashboard_card2.dart';
import 'package:week_challenge_52/components/random_quote.dart';
import 'package:week_challenge_52/models/goal.dart';
import 'package:week_challenge_52/models/dashboard_calculations.dart';
import 'package:week_challenge_52/service/goal_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Goal> goalList = [];
  late GoalService _goalService;
  late DashboardCalulations dc;

  @override
  void initState() {
    _goalService = GoalService.instance;
    setState(() {
      goalList = _goalService.fetchGoalList();
    });
    dc = DashboardCalulations(goalList: goalList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RandomQuote(
                randomQuote: dc.randomQuote(),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your Goal Summary",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard2(
                      title: "Total Goals",
                      count: dc.totalGoalCount(),
                      icon: const ImageIcon(
                        AssetImage('assets/images/goal.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DashboardCard2(
                      title: "Completed Goals",
                      count: dc.completedGoalCount(),
                      icon: const Icon(
                        Icons.check_box_outlined,
                        color: Color.fromARGB(255, 89, 88, 88),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 90),
                  Expanded(
                    child: DashboardCard2(
                      title: "Active Goals",
                      count: dc.totalGoalCount() - dc.completedGoalCount(),
                      icon: const Icon(
                        Icons.toggle_on,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 90),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard2(
                      title: "Monthly Goals",
                      count: dc.totalMonthlyGoalCount() -
                          dc.completedMonthlyGoalCount(),
                      icon: const Icon(
                        Icons.calendar_view_month_outlined,
                        color: Color.fromRGBO(227, 93, 133, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DashboardCard2(
                      title: "Weekly Goals",
                      count: dc.totalWeeklyGoalCount() -
                          dc.completedWeeklyGoalCount(),
                      icon: const Icon(
                        Icons.calendar_view_week_outlined,
                        color: Color.fromRGBO(94, 178, 93, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              DashboardCard1(
                title: "Total Savings",
                amount: dc.overallSavings(),
              ),
              const SizedBox(height: 10),
              DashboardCard1(
                title: "Total Amount Deposited",
                amount: dc.overallDeposit(),
              ),
              const SizedBox(height: 10),
              DashboardCard1(
                title: "Monthly Goal Deposits",
                amount: dc.overallMonthlyDeposit(),
              ),
              const SizedBox(height: 10),
              DashboardCard1(
                title: "Weekly Goal Deposits",
                amount: dc.overallWeeklyDeposit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
