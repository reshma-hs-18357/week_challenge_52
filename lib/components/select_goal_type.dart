import 'package:flutter/material.dart';

class SelectGoalType extends StatelessWidget {
  const SelectGoalType({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How do you want to save your money each week",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 141,
                  width: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Progressive",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "The amount saved will be increased every week",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: const Color.fromRGBO(77, 182, 77, 1),
                elevation: 10,
                child: Container(
                  height: 141,
                  width: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Constant",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "The amount saved will be the same over the weeks",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
