import 'package:flutter/material.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: const Text(
            'Cooking',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: const Center(child: Icon(Icons.fastfood)));
  }
}