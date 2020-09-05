import 'package:assignmentApp/Ui/widgets/widgets.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostProvider>(context).allPosts;
    print(posts.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Facebook'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CreatePostWidget(),
          ...posts
              .map(
                (post) => PostWidget(post: post),
              )
              .toList()
        ],
      ),
    );
  }
}
