// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildBottomBar() => BottomNavigationBar(
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.stairs_outlined),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            backgroundColor: Colors.white,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Learn',
          ),
        ],
      );
  Widget buildNavigateButton() => SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 239, 248, 1),
      body: Column(children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundColor: Color.fromRGBO(77, 182, 76, 1),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/images/piggy.png'),
                ),
              ),
              SizedBox(width: 64),
              Text(
                "52 Weeks",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
            height: 251,
            width: 210,
            child:
                Image.asset('assets/images/money.png', fit: BoxFit.fitHeight)),
        const Padding(
          padding: EdgeInsets.fromLTRB(53, 30, 53, 16),
          child: SizedBox(
            height: 60,
            width: 269,
            child: Text(
              "Oops! You have no registered goals",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Text("Add new goals using the button(+)"),
        )
      ]),
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: buildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
