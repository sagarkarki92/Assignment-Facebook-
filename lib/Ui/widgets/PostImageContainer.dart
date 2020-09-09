import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostImageContainer extends StatelessWidget {
  final List<dynamic> postImages;
  PostImageContainer({Key key, this.postImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.35;
    final double containerWidth = MediaQuery.of(context).size.width;

    if (postImages.length == 1) {
      return _singleImageContainer(containerHeight, containerWidth);
    } else if (postImages.length == 2) {
      return _twoImageContainer(containerHeight, context);
    } else if (postImages.length > 2 && postImages.length <= 4) {
      return _threeImagesContainer(containerHeight, containerWidth);
    } else if (postImages.length > 4) {
      return _moreThanFourImageContainer(containerHeight, containerWidth);
    } else {
      print(postImages.length);
      return SizedBox.shrink();
    }
  }

  Widget _moreThanFourImageContainer(
      double containerHeight, double containerWidth) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        spacing: 16.0,
        children: [
          ...List.generate(4, (index) {
            if (index == 3) {
              return _moreTagImage(
                  postImages[index], containerHeight, containerWidth);
            }
            return PostImage(
              image: postImages[index],
              fit: BoxFit.cover,
              height: containerHeight * 0.45,
              width: containerWidth * 0.45,
            );
          }).toList()
        ],
      ),
    );
  }

  _moreTagImage(
      dynamic postImage, double containerHeight, double containerWidth) {
    return Stack(
      children: [
        PostImage(
          image: postImage,
          fit: BoxFit.cover,
          height: containerHeight * 0.45,
          width: containerWidth * 0.45,
        ),
        Container(
          height: containerHeight * 0.45,
          width: containerWidth * 0.45,
          color: Colors.transparent.withOpacity(0.4),
          child: Center(
            child: Text(
              'More',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _threeImagesContainer(double containerHeight, double containerWidth) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        spacing: 16.0,
        children: [
          ...postImages
              .map(
                (image) => PostImage(
                  image: image,
                  fit: BoxFit.cover,
                  height: containerHeight * 0.45,
                  width: containerWidth * 0.45,
                ),
              )
              .toList()
        ],
      ),
    );
  }

  Widget _twoImageContainer(double containerHeight, BuildContext context) {
    return Container(
      height: containerHeight,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ...postImages
              .map(
                (image) => Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: PostImage(
                      image: image,
                      fit: BoxFit.cover,
                      height: containerHeight,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  Widget _singleImageContainer(double containerHeight, double containerWidth) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      child: PostImage(
        image: postImages[0],
        height: containerHeight * 0.50,
        width: containerWidth * 0.5,
        fit: BoxFit.contain,
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  final dynamic image;
  final double width;
  final double height;
  final BoxFit fit;
  const PostImage({Key key, this.image, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image is ByteData) {
      return Image.memory(
        image.buffer.asUint8List(),
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(
        image,
        height: height,
        width: width,
        fit: fit,
      );
    }
  }
}
