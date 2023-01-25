import 'package:flutter/material.dart';

class SavingsCard extends StatelessWidget {
  final double savings;
  const SavingsCard({super.key, required this.savings});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 118,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                'assets/images/trophy.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '''At the end of the challenge you
             will have saved''',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    (savings == 0.0) ? '-' : '$savings',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
