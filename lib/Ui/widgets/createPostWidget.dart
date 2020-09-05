import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../routes.dart' as routes;

class CreatePostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.00, 8.0, 0.0, 8.0),
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: _writePost(context),
    );
  }

  Widget _writePost(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: CachedNetworkImageProvider(
            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              print('status pressed');
              Navigator.of(context).pushNamed(routes.postScreen);
            },
            child: Text(
              'Whats on your mind?',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
