import 'package:flutter/material.dart';

class ImageFill extends StatefulWidget {
  String image;
  String iname;

  ImageFill({Key key, @required this.image, this.iname}) : super(key: key);

  @override
  _ImageFillState createState() => _ImageFillState(this.image, this.iname);
}

class _ImageFillState extends State<ImageFill> {
  String image;
  String iname;

  _ImageFillState(this.image, this.iname);

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
            child: Image.asset("$image"),
          ),
        ));
  }
}
