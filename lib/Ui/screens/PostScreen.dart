import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:assignmentApp/model/post.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import '../../routes.dart' as routes;

class PostScreen extends StatefulWidget {
  PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //for new post
  String _appTitle = 'New Post';
  String _postButton = 'Post';
  String _status = '';

  //for accessing provider globally in this class
  Post previousPost;
  PostProvider postProvider;

  List<ByteData> images = List();

  showErrorDialog({String message = 'No status or Photos to create a post'}) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Failed!',
          style: TextStyle(color: Theme.of(context).errorColor),
        ),
        titlePadding: const EdgeInsets.all(24),
        content: Text('$message'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _areFieldsEmpty() => _status.trim().isEmpty && images.isEmpty;

  postHandler() async {
    if (_areFieldsEmpty()) {
      showErrorDialog();
    } else {
      postProvider.addNewPost(_status.trim(), images);
      Navigator.pop(context);
    }
  }

  editHandler() {
    if (_areFieldsEmpty()) {
      showErrorDialog();
    } else {
      if (!listEquals(previousPost.imageUrls, images) ||
          previousPost.status != _status) {
        postProvider.editPost(previousPost.id, _status, images);
        Navigator.pop(context);
      } else {
        showErrorDialog(message: 'No new Content added to Edit the post!');
      }
    }
  }

  Future<void> loadImageFromGallery() async {
    List<Asset> resultImageList;
    try {
      resultImageList = await MultiImagePicker.pickImages(maxImages: 300);

      List<ByteData> imgData = new List();
      for (var image in resultImageList) {
        imgData.add(await image.getByteData());
      }

      if (!mounted) return;

      setState(() {
        images = [...imgData];
      });
    } catch (error) {
      print(error.toString());
    }
  }

  cancelUploadImage(ByteData image) {
    setState(() {
      images.remove(image);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //calling this from here and not from inside build is because build method runs every rerendering
    //and no use of calling this in every render
    postProvider = Provider.of<PostProvider>(context, listen: false);
    final id = ModalRoute.of(context).settings.arguments as String;

    if (id != null) {
      previousPost = postProvider.findPost(id);

      _status = previousPost.status;
      _appTitle = 'Edit Post';
      _postButton = 'Edit';
      images = [...previousPost.imageUrls];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Whats on your mind?",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 4,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
              initialValue: _status,
              maxLines: 4,
              onChanged: (inputvalue) => _status = inputvalue,
            ),
            FlatButton.icon(
              onPressed: loadImageFromGallery,
              icon: Icon(Icons.photo),
              label: Text('Add Photo'),
            ),
            images.isEmpty
                ? Spacer()
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 4.0,
                      children: [
                        ...images.map((image) {
                          return UploadImageItem(
                            image: image.buffer.asUint8List(),
                            onPress: () => cancelUploadImage(image),
                          );
                        })
                      ],
                    ),
                  ),
            RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  _postButton,
                ),
                onPressed: () =>
                    _postButton == "Post" ? postHandler() : editHandler()),
          ],
        ),
      ),
    );
  }
}

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
          fit: BoxFit.fill,
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
