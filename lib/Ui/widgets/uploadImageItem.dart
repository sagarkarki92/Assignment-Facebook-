import 'dart:typed_data';

import 'package:flutter/material.dart';

class UploadImageItem extends StatelessWidget {
  final Uint8List image;
  final Function onPress;

  UploadImageItem({Key key, this.image, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.memory(
          image,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black54,
              Colors.transparent,
            ],
          )),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: onPress,
          ),
        ),
      ],
    );
  }
}
