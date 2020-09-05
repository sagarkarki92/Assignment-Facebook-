import 'dart:math';

import 'package:assignmentApp/model/post.dart';
import 'package:assignmentApp/provider/data.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  List<Post> posts = [...dummyPosts];

  List<Post> get allPosts {
    return [...posts];
  }

  addNewPost(String status) {
    Post newPost = Post(
        id: Random().nextInt(100).toString(),
        status: status,
        imageUrls: [
          'first',
          'This should be changed when image part is done!'
        ]);

    posts.insert(0, newPost); //inserting post at first in list
    notifyListeners();
  }

  editPost(Post post) {
    final index = posts.indexWhere((p) => p.id == post.id);
    posts[index] = post;
    notifyListeners();
  }

  Post findPost(String id) {
    return posts.firstWhere((post) => post.id == id, orElse: null);
  }
}
