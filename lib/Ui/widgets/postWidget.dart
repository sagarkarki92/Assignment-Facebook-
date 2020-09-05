import 'package:assignmentApp/model/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../routes.dart' as routes;

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _postHeader(post, context),
          _postBody(
              'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
        ],
      ),
    );
  }

  _postHeader(Post post, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hari Krishna",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              PopupMenuButton(
                  onSelected: (value) =>
                      Navigator.of(context).pushNamed(routes.postScreen),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: FlatButton(
                            onPressed: () =>
                                _switchToPostScreen(context, post.id),
                            child: Text('Edit'),
                          ),
                        )
                      ]),
            ],
          ),
          SizedBox(height: 8.0),
          post.status != null ? Text(post.status) : SizedBox(),
        ],
      ),
    );
  }

  _switchToPostScreen(BuildContext context, String id) {
    Navigator.of(context).pushNamed(routes.postScreen, arguments: post.id);
  }

  _postBody(String imageUrl) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl:
                'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          )
        : const SizedBox.shrink();
  }
}
