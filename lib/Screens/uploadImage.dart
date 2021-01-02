import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photography_ux/Screens/userLoaded_image.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File image_file;
  final _uploadedImages = [];

  _openGallery(BuildContext context) async {
    var picture =
        image_file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image_file = picture;
      image_file == null
          ? _uploadedImages.remove(image_file)
          : _uploadedImages.add(image_file);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture =
        image_file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image_file = picture;
      image_file == null
          ? _uploadedImages.remove(image_file)
          : _uploadedImages.add(image_file);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialog(BuildContext context) async {
    Color primary = Theme.of(context).primaryColor;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choice ?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                    width: 160,
                    child: RaisedButton(
                      highlightElevation: 0.0,
                      splashColor: Colors.white,
                      highlightColor: primary,
                      elevation: 0.0,
                      color: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.album,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Gallery",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _openGallery(context);
                        });
                      },
                    ),
                    height: 50,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    width: 160,
                    child: RaisedButton(
                      highlightElevation: 0.0,
                      splashColor: Colors.white,
                      highlightColor: primary,
                      elevation: 0.0,
                      color: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Camera",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _openCamera(context);
                        });
                      },
                    ),
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImage() {
//    if (image_file == null) {
//      return Center(child: Image.asset("img/no_image.png"));
//    } else {
    return GridView.builder(
        itemCount: _uploadedImages.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Hero(
              tag: "Image ${index + 1}",
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UserLoadImage(
                        image: Image.file(_uploadedImages[index]),
                        iname: 'Image ${index + 1}',
                      );
                    }));
                  },
                  child: GridTile(
                    footer: Container(
                      child: ListTile(
                        leading: Text(
                          "Image ${index + 1}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      color: Colors.black12,
                    ),
                    child: Image.file(
                      _uploadedImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Upload Image"),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "img/upload.png",
              color: Colors.white,
            ),
            tooltip: "Upload Image",
            onPressed: () {
              return _showDialog(context);
            },
          ),
        ],
      ),
      body: _uploadedImages.length < 1
          ? Center(child: Image.asset("img/no_image.png"))
          : _decideImage(),
    );
  }
}
