import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:assignmentApp/model/dummyData.dart';
import 'package:assignmentApp/model/post.dart';

class PostProvider extends ChangeNotifier {
  int currentPage = 0;
  final int totalPageCount = 5;

  bool _isPostAlreadyFetching = false;
  bool morePosts = true;

  //just for editing post.as our post is not saved in any api.so post that is in this list are only editable
  List<Post> editablePosts = List();

  List<Post> posts = [...firstTenPosts];
  bool get hasMorePosts => morePosts;

  List<Post> get allPosts {
    return [...posts];
  }

  void addNewPost(String status, List<ByteData> images) {
    Post newPost = Post(
        id: Random().nextInt(100).toString(),
        status: status,
        imageUrls: [...images]);

    posts.insert(0, newPost);

    //the post we added in the one we can edit.
    editablePosts.insert(0, newPost);
    //making api call to save post from here
    notifyListeners();
  }

  void editPost(String postId, String status, List<ByteData> images) {
    //editing the post in postlist by finding its id
    final index = posts.indexWhere((p) => p.id == postId);
    posts[index].status = status;
    posts[index].imageUrls = [...images];

    //making api call from here with patch method to save changes...
    notifyListeners();
  }

  getMorePosts() async {
    //to prevent from fetching more post while one request of fetching is already in process
    if (!_isPostAlreadyFetching) {
      if (currentPage != totalPageCount) {
        _isPostAlreadyFetching = true;

        //this is dummy data populating to post list
        for (int i = 0; i < 10; i++) {
          posts.add(dummyPosts[i]);
        }
        //mocking network call as its a future.
        await Future.delayed(Duration(milliseconds: 1500));
        ++currentPage;
        _isPostAlreadyFetching = false;
        notifyListeners();
      } else {
        _isPostAlreadyFetching = false;
        //when no more pages to fetch,setting morePosts to false.
        morePosts = false;
        notifyListeners();
      }
    }
  }

  bool isPostEditable(Post post) {
    return editablePosts.contains(post);
  }

  Post findPost(String id) {
    return posts.firstWhere((post) => post.id == id, orElse: null);
  }
}
