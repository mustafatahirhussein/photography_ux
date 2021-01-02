import 'package:flutter/material.dart';

class UserLoadImage extends StatefulWidget {
  Image image;
  String iname;

  UserLoadImage({Key key, @required this.image, this.iname}) : super(key: key);

  @override
  _UserLoadImageState createState() =>
      _UserLoadImageState(this.image, this.iname);
}

class _UserLoadImageState extends State<UserLoadImage> {
  Image image;
  String iname;

  _UserLoadImageState(this.image, this.iname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.iname}',
            style: TextStyle(color: Colors.black),
          ),
          leading: InkWell(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            child: image,
          ),
        ));
  }
}
