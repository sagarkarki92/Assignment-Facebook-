import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:assignmentApp/config/noPageException.dart';
import 'package:assignmentApp/model/dummyData.dart';
import 'package:assignmentApp/model/post.dart';

class PostProvider extends ChangeNotifier {
  int currentPage = 1;
  final int totalPageCount = 5;
  final int postPerPage = 10;

  List<Post> posts = [...firstTenPosts];

  List<Post> get allPosts {
    return [...posts];
  }

  Future<void> getMorePosts(int lastIndex) async {
    if (currentPage <= totalPageCount) {
      for (int i = lastIndex; i < lastIndex + 10; i++) {
        posts.add(dummyPosts[i]);
      }
      await Future.delayed(Duration(milliseconds: 1500));
      currentPage++;
      notifyListeners();
    } else {
      throw NoPostException();
    }
  }

  Future<void> addNewPost(String status, List<ByteData> images) async {
    Post newPost = Post(
        id: Random().nextInt(100).toString(),
        status: status,
        imageUrls: [...images]);

    posts.insert(0, newPost);
    //making api call to save post from here
    notifyListeners();
  }

  editPost(String postId, String status, List<ByteData> images) {
    final index = posts.indexWhere((p) => p.id == postId);
    posts[index].status = status;
    posts[index].imageUrls = [...images];

    //making api call from here with patch method to save changes...
    notifyListeners();
  }

  Post findPost(String id) {
    return posts.firstWhere((post) => post.id == id, orElse: null);
  }
}
