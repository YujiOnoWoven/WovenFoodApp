import 'package:flutter/material.dart';
import 'package:woven_food_app/pages/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:woven_food_app/thema/colors.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //don't want to show banner バーナーを見せたくない
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("posts").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {


                    return Card(
                      child: ListTile(
                        //教科書：https://rightcode.co.jp/blog/information-technology/flutter-firebase-bulletin-board-app-make
                        //title: Text(document.data()['content']),
                        //苦労した部分
                        title: Text(document['content']),
                        subtitle: Text("サブタイトル"),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
      ),
    );
  }
}

/* nagai add -> */
class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {

  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      padding: const EdgeInsets.only(left: 20),
      icon: (_isLiked ? const Icon(Icons.thumb_up) : const Icon(Icons.thumb_up)),
      color: (_isLiked ? const Color(0xFD032BF6) : const Color(0xFF37373D)),
      onPressed: _toggleLike,
    );
  }

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _isLiked = false;
      } else {
        _isLiked = true;
      }
    });
  }
}

class UnLike extends StatefulWidget {
  const UnLike({Key? key}) : super(key: key);

  @override
  _UnLikeState createState() => _UnLikeState();
}

class _UnLikeState extends State<UnLike> {

  bool _isUnLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      padding: const EdgeInsets.only(left: 20),
      icon: (_isUnLiked ? const Icon(Icons.thumb_down) : const Icon(Icons.thumb_down)),
      color: (_isUnLiked ? const Color(0xFDF6030B) : const Color(0xFF37373D)),
      onPressed: _toggleLike,
    );
  }

  void _toggleLike() {
    setState(() {
      if (_isUnLiked) {
        _isUnLiked = false;
      } else {
        _isUnLiked = true;
      }
    });
  }
}

/* <- nagai add */