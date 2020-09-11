import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:assignmentApp/model/post.dart';
import 'package:assignmentApp/provider/postProvider.dart';
import '../widgets/widgets.dart';

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

  //checking empty for both new and edit post.
  _areFieldsEmpty() => _status.trim().isEmpty && images.isEmpty;

  newPostHandler() async {
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
      //checking content of imagesList with previous one
      if (!listEquals(previousPost.imageUrls, images) ||
          previousPost.status != _status.trim()) {
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

      //getting byteData of picked images
      List<ByteData> imgData = new List();
      for (var image in resultImageList) {
        imgData.add(await image.getByteData());
      }

      //incase imagePicking operation failed in any case(from documentation)
      if (!mounted) return;

      setState(() {
        images = images + imgData;
      });
    } catch (error) {
      //currently just printing in terminal if exception occured.
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
            _statusField(context),
            FlatButton.icon(
              onPressed: loadImageFromGallery,
              icon: Icon(Icons.photo),
              label: Text('Add Photo'),
            ),
            images.isEmpty ? Spacer() : _selectedImagesContainer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    _postButton,
                  ),
                  onPressed: () =>
                      _postButton == "Post" ? newPostHandler() : editHandler()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedImagesContainer() {
    return Expanded(
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
    );
  }

  Widget _statusField(BuildContext context) {
    return TextFormField(
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
    );
  }
}
