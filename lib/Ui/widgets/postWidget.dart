import 'package:assignmentApp/Ui/widgets/PostImageContainer.dart';
import 'package:assignmentApp/model/post.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes.dart' as routes;

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //as described I made posts UI similiar to facebook.So i didnt keep include border,margin left and right,
    //and radius to container.
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _postHeader(context),
          _postBody(),
        ],
      ),
    );
  }

  _postHeader(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
              'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            "John Doe",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Spacer(),
          //allowing edit only to those post which was uploaded as its a byteData.

          postProvider.isPostEditable(post)
              ? PopupMenuButton(
                  onSelected: (value) => {
                    value == 'edit'
                        ? _switchToPostScreen(context, post.id)
                        : null
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('edit'),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  _switchToPostScreen(BuildContext context, String id) {
    //passing post id to next page.so that with this id we can retrieve post from post provider.
    Navigator.of(context).pushNamed(routes.postScreen, arguments: post.id);
  }

  _postBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        post.status.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(post.status),
              )
            : SizedBox.shrink(),
        SizedBox(height: 6.0),
        PostImageContainer(postImages: post.imageUrls),
      ],
    );
  }
}
