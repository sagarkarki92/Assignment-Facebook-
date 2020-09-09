import 'package:assignmentApp/Ui/widgets/PostImageContainer.dart';
import 'package:assignmentApp/model/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../routes.dart' as routes;

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _postHeader(post, context),
          _postBody(post.imageUrls),
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
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(
                  'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                ),
              ),
              SizedBox(width: 6.0),
              Text(
                "Hari Krishna",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
              post.imageUrls is ByteData
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
          SizedBox(height: 8.0),
          post.status.isNotEmpty ? Text(post.status) : SizedBox.shrink(),
        ],
      ),
    );
  }

  _switchToPostScreen(BuildContext context, String id) {
    Navigator.of(context)
        .pushReplacementNamed(routes.postScreen, arguments: post.id);
  }

  _postBody(List<dynamic> imageUrls) {
    return PostImageContainer(postImages: imageUrls);
  }
}
