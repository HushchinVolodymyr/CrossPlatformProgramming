import 'package:app/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class Task2page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Center(
            child: 
              SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Text("Task 2"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print('Button Pressed');
                      },
                      child: Text('Press Me'),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}