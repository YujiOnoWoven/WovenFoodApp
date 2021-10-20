import 'package:flutter/material.dart';
import 'package:woven_food_app/pages/root_app2.dart';
//root_appをimportすることでhome: RootAppが使用可能

void main() {
  runApp(
    const MaterialApp(
      //don't want to show banner バーナーを見せたくない
      debugShowCheckedModeBanner: false,
      //最初にMyStatefulWidgetのクラスに飛んで欲しい Jump to page to MSW
      home: MyStatefulWidget(),
    )
  );
}