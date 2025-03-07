import 'package:app/pages/Task1Page.dart';
import 'package:app/pages/Task2Page.dart';
import 'package:app/pages/Task3Page.dart';
import 'package:app/pages/Task4Page.dart';
import 'package:app/pages/Task5Page.dart';
import 'package:app/pages/Task6Page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text("Task 1"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task1Page()));
            },
          ),
          ListTile(
            title: Text("Task 2"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task2page()));
            },
          ),
          ListTile(
            title: Text("Task 3"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task3page()));
            },
          ),
          ListTile(
            title: Text("Task 4"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task4Page()));
            },
          ),
          ListTile(
            title: Text("Task 5"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task5page()));
            },
          ),
          ListTile(
            title: Text("Task 6"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task6page()));
            },
          ),
        ],
      ),
    );
  }
}
