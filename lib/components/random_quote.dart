import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Text(randomQuote,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.artifika(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
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
