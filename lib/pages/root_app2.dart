//Second Plan to create main page
/// Flutter code sample for BottomNavigationBar
//Explain about BottomNavigation
//https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
//BottomNavigationの色を変えたり、ページ遷移の色を変えたり
//https://flutter.ctrnost.com/basic/navigation/bottomnavigationbar/
//icons
//https://api.flutter.dev/flutter/material/Icons-class.html

//今後やること、ScaffoldでbodyとBottomNavigationBarを分ける
//または、次のコードを試してみる
//https://qiita.com/canisterism/items/d648da85c300a3751db0

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:woven_food_app/thema/colors.dart';
import 'package:woven_food_app/pages/cook_screen.dart';
import 'package:woven_food_app/pages/home_screen.dart';
import 'package:woven_food_app/pages/post.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //ページインデックス()
  int _selectedIndex = 0;
  //static const applies only within the class. In this case, It's MSW.
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //リストで管理する(配列を宣言)
  static const List<Widget> _widgetOptions = <Widget>[
    CookScreen(
    ),
    HomeScreen(
    ),
    Text(
      'Dummy 2: Home',
      style: optionStyle,
    ),
    Text(
      'Dummy 3: Coin',
      style: optionStyle,
    ),
    Text(
      'Dummy 4: Setting',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//下記でappBar,body,bottomNavigationBarを分け、bodyは_wid...で
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WovenFoodApp'),
        backgroundColor: const Color(0xff5bc0de),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PostPage();
              }));
            },
          ),
        ],
      ),
      body: Center(
        //ここでindexと_widgetOption(List)が合流
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            backgroundColor: Color(0xff5bc0de),
            label: 'Cooking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            backgroundColor: Color(0xff5bc0de),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color(0xff5bc0de),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            backgroundColor: Color(0xff5bc0de),
            label: 'Coin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_settings_alt),
            backgroundColor: Color(0xff5bc0de),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        //選択時に色が変化。When they select bottom, color will be changed.
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: info,
      ),
    );
  }
}
