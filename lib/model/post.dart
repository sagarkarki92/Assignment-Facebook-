class Post {
  final String id;

  String status;

  //making this dynamic because for dummy images i used Imagenetwork widget which requires String and for uploaded
  //images i took byteData(to save in backend if necessary) of images which requires Imagememory widget.so making
  //this list of imageUrls solves this particular issue.
  List<dynamic> imageUrls;

  Post({this.id, this.status, this.imageUrls});
}
