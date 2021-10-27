import 'package:flutter/material.dart';
import 'package:woven_food_app/pages/post.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //don't want to show banner バーナーを見せたくない
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Now we create AWS & Firebase function' * 2),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 200,
                        child: Image.network('https://i.imgur.com/i29MiN4.jpeg'),
                      ),
                      const Divider(),

                      /* nagai add -> */

                      Center(
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Like(),
                              const UnLike(),
                            ],
                          ),
                        ),
                      ),
                      /* <- nagai add */

                      RichText(
                      text: const TextSpan(
                      text: 'Sample recipe\n•tomato •potato\n•meat •Bans',
                      )
                      ),
                      const Divider(),
                    ],
                  );
                },
                childCount: 20,
              ),
            ),
          ],
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