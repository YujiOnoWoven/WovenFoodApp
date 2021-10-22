import 'package:flutter/material.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('写真ロードできないじゃんよ Now loading function cant work//' * 2),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: Image.network('https://photos.google.com/album/AF1QipPZicJ0ET9pKiwjw5ilnRASfcjUgmmwBk5iWvX-'),
                      ),
                      const Divider(),
                      RichText(
                      text: const TextSpan(
                      text: 'Sample recipe\n・tomato\n・meat',
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
