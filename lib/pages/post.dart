import 'package:woven_food_app/pages/add_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: SizedBox(
                          width: 100,
                          height: 160,
                          child: model.imageFile != null
                              ? Image.file(model.imageFile!)
                              : Container(
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          print("反応！");
                          await model.pickImage();
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '本のタイトル',
                        ),
                        onChanged: (text) {
                          model.title = text;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '本の著者',
                        ),
                        onChanged: (text) {
                          model.author = text;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // 追加の処理
                          try {
                            model.startLoading();
                            await model.addBook();
                            Navigator.of(context).pop(true);
                          } catch (e) {
                            print(e);
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } finally {
                            model.endLoading();
                          }
                        },
                        child: Text('追加する'),
                      ),
                    ],
                  ),
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}



/*
class PostPage extends StatefulWidget {


  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {

  _onSubmitted(String content){
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    posts.add({
      "content": content
    });

    _textEditingController.clear();
  }

  TextEditingController _textEditingController = TextEditingController();

  final picker = ImagePicker();
  File? imageFile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投稿画面"),
      ),
      body: Center(

        child: TextField(
          controller: _textEditingController,
          onSubmitted: _onSubmitted, // この一文を追加
          enabled: true,
          maxLength: 50, // 入力数
          maxLengthEnforced: false, // 入力上限になったときに、文字入力を抑制するか
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines:1 ,
          decoration: const InputDecoration(
            icon: Icon(Icons.speaker_notes),
            hintText: '投稿内容を記載します',
            labelText: '内容 * ',
          ),
        ),
      ),
    );
  }
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }
}

 */