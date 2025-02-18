import 'package:app/widgets/MyDrawer.dart';
import 'package:app/widgets/Task1Part1.dart';
import 'package:app/widgets/Task1Part2.dart';
import 'package:flutter/material.dart';

class Task1Page extends StatefulWidget {
  @override
  _Task1PageState createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
  // Index of the selected page
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    Task1Part1(),
    Task1Part2(),
  ];

  // Handle the bottom navigation bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the app bar
      appBar: AppBar(title: Text("Task 1")),
      // Set the drawer
      drawer: MyDrawer(),
      // Set the body depending on the selected index
      body: _pages[_selectedIndex],
      // Set the bottom navigation bar with two items
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: 'Part 1'),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: 'Part 2'),
        ],
      ),
    );
  }
}
