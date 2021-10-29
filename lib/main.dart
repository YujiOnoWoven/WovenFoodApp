import 'package:flutter/material.dart';
import 'package:woven_food_app/pages/root_app2.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    )
  );
}

