import 'package:flutter/material.dart';
import 'package:todos/widget/homescreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ToDos'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
