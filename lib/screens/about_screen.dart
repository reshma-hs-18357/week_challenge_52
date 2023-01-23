import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final SizedBox sizedBox = const SizedBox(height: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
        title: const Text(
          "About",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(255, 249, 247, 251),
              elevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/savings.png',
                        height: 300, width: 300),
                    sizedBox,
                    const Text("52-Week Challenge",
                        style: TextStyle(fontSize: 18)),
                    sizedBox,
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        '''The 52-week saving challenge is one of the simplest challenges that you can do at the start of the new year. That's because it gets you off to an easy start but you build up your efforts over time.

With the 52-week challenge, here's what you do. In the first week of the year, you save 1. In the second week, you save 2 and in the third week, you save 3. You then continue to add an extra dollar onto the amount you save every single week as the year goes on. So, in the 40th week of the year, you'd be saving 40 and in week 52, you'd put 52 into your savings account.

At the end of the 52 week saving challenge, if you have kept up with the process every single week, you would end up having saved a total of 1,378 during the course of the year. That's not a bad sum of money -- especially since many of the contributions that you will be making during the early part of the year are very low and are thus very easy to find the money for.''',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
