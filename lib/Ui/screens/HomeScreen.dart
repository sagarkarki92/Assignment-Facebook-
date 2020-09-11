import 'package:assignmentApp/Ui/widgets/widgets.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//currently there are no other features so every thing is in screen widget ,or else we can extract
//this into another widget for clean structure

class _HomeScreenState extends State<HomeScreen> {
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
          //checking to go end of the list to get paginated data(posts)
          if (scrollNotification is ScrollEndNotification &&
              scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
            postProvider.getMorePosts();
            return true;
          }
          return false;
        },
        child: ListView.builder(
          // + 2 for create new post and fetching indicator at last.
          itemCount: posts.length + 2,
          itemBuilder: (context, index) {
            //for rendering create post container at first of list
            if (index == 0) {
              return CreatePostWidget();
            } else if (index == posts.length + 1 && postProvider.hasMorePosts) {
              //for rendering fetching indicator at the end of the list.
              return _fetchingLabel(context, 'Fetching post...');
            } else if (index <= posts.length) {
              //rendering post from posts list
              return PostWidget(
                post: posts[index - 1],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _fetchingLabel(BuildContext context, String label) {
    return Center(
      heightFactor: 4,
      child: Text('$label',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey)),
    );
  }
}
