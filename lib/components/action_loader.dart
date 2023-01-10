import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionLoader extends StatelessWidget {
  const ActionLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 3, 95, 170),
            ),
            const SizedBox(height: 20),
            const Text("Loading"),
          ],
        ),
      ),
    );
  }
}
