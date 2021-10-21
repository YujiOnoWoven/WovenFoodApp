import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: const Center(child: Icon(Icons.shopping_basket)
        )
    );
  }
}