import 'package:flutter/material.dart';
import 'package:woven_food_app/pages/root_app2.dart';
import 'package:firebase_core/firebase_core.dart';
//root_appをimportすることでhome: RootAppが使用可能

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      //don't want to show banner バーナーを見せたくない
      debugShowCheckedModeBanner: false,
      //最初にMyStatefulWidgetのクラスに飛んで欲しい Jump to page to MSW
      home: MyStatefulWidget(),
    )
  );
}

