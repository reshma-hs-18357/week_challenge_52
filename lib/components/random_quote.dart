import 'package:flutter/material.dart';

class RandomQuote extends StatelessWidget {
  final String randomQuote;
  const RandomQuote({super.key, required this.randomQuote});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                ImageIcon(
                  AssetImage(
                    'assets/images/quotation-mark-icon.png',
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              randomQuote,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 64, 1, 75),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: const [
                Spacer(),
                ImageIcon(
                  AssetImage(
                    'assets/images/quotation-mark-right-icon.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
