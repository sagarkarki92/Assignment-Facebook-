import 'package:assignmentApp/Ui/widgets/widgets.dart';
import 'package:assignmentApp/config/noPageException.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    // _controller.addListener(() {
    //   if (_controller.position.pixels == _controller.position.maxScrollExtent) {
    //     print("This is last");
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool onNotification(ScrollNotification scrollNotification) {}

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final posts = postProvider.allPosts;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Facebook'),
        centerTitle: true,
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            try {
              // setState(() {
              //   isLoading = !isLoading;
              // });
              // postProvider.getMorePosts(posts.length);
            } on NoPostException catch (_) {
              // setState(() {
              //   isLoading = !isLoading;
              // });
            }
          }
          return true;
        },
        child: ListView.builder(
          controller: _controller,
          itemCount: posts.length + 2,
          itemBuilder: (context, index) {
            //for rendering create post container at first of list
            if (index == 0) {
              return CreatePostWidget();
            }

            if (posts.length + 1 == index) {
              return FutureBuilder(
                  future: postProvider.getMorePosts(index - 1),
                  builder: (context, data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return SizedBox();
                  });
            }

            // print(index);
            return PostWidget(
              post: posts[index - 1],
            );
          },
        ),
      ),
    );
  }
}
