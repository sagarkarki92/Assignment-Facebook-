import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String _appTitle = 'New Post';
  String _postButton = 'Post';
  String _status = '';
  List<String> images;

  postHandler(PostProvider postProvider) {
    //adding to post provider list
    postProvider.addNewPost(_status);
    Navigator.pop(context);
  }

  editHandler(PostProvider postProvider) {
    // postProvider.editPost();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    final id = ModalRoute.of(context).settings.arguments as String;
    if (id != null) {
      final editPost = postProvider.findPost(id);
      setState(() {
        _status = editPost.status;
        _appTitle = 'Edit Post';
        _postButton = 'Edit';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Whats on your mind?",
                  border: OutlineInputBorder(),
                ),
                initialValue: _status,
                onChanged: (inputvalue) => _status = inputvalue,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.photo),
                label: Text('Add Photo'),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  _postButton,
                ),
                onPressed: () => _postButton == 'Post'
                    ? postHandler(postProvider)
                    : editHandler(postProvider),
              )
            ],
          ),
        ),
      ),
    );
  }
}
