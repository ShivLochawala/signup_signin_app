import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic app with firebase'),),
      body: Center(
        child: Text('Welcome To Basic app with firebase'),
      ),
    );
  }
}