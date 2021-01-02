import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photography_ux/Screens/ImagesList.dart';
import 'package:photography_ux/Screens/fromThisApp.dart';
import 'package:photography_ux/Widgets/popup_items.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionUploadImage extends StatefulWidget {
  String clientName;
  String clientCell;

  @override
  _SessionUploadImageState createState() => _SessionUploadImageState();
}

class _SessionUploadImageState extends State<SessionUploadImage> {
  var _url = GlobalKey<FormState>();
  var _urlController = TextEditingController();
  String urlOfImage;

  File imageFile;
  final _uploadedImages = [];
  final forWebOnly = [];

  _openGallery() async {
    var pic =
        imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pic;
      imageFile == null
          ? _uploadedImages.remove(imageFile)
          : _uploadedImages.add(imageFile);
    });
    return Center(child: CircularProgressIndicator());
  }

  _openCamera() async {
    var pic =
        imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = pic;
      imageFile == null
          ? _uploadedImages.remove(imageFile)
          : _uploadedImages.add(imageFile);
    });
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    //for menu of appbar
    var _blankFocusNode = FocusNode();

    BuildContext _builtContext;

    void UserChoice(String choice) {
      _builtContext = this.context;
//      if (choice == Constants.addSession) {
//        Navigator.push(_builtContext,
//            MaterialPageRoute(builder: (_builtContext) {
//          return AddSession(
//            clientName: clientName,
//          );
//        }));
//      }
      if (choice == Constants.close) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ImagesListData(
                loginUser:
                    widget.clientName == null ? '' : widget.clientName)));
      }
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                fit: BoxFit.cover,
              ),
              tooltip: 'Upload Image',
              onPressed: () {
                setState(() {
                  loadBottomSheet(context);
                });
              },
            ),
            PopupMenuButton<String>(
              onSelected: UserChoice,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                ),
                text: 'Camera/Gallery/Local',
              ),
              Tab(
                icon: Icon(
                  Icons.web,
                  color: Colors.white,
                ),
                text: 'Web',
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: TabBarView(
            children: <Widget>[
              _localImagesOnly(context),
              _webImagesOnly(context),
            ],
          ),
        ),
      ),
    );
  }

  loadBottomSheet(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          side: BorderSide(color: Colors.black, width: 3),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 210.0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                            Icons.apps,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "From this App",
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
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FromThisApp()));
                        });
                      },
                    ),
                    height: 50,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                          _openCamera();
                        });
                      },
                    ),
                    height: 50,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                          _openGallery();
                        });
                      },
                    ),
                    height: 50,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                          Image.asset(
                            'img/url.png',
                            color: Colors.white,
                            height: 25,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "URL",
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
                          Navigator.pop(context);
                          _urlController.text =
                              "https://homepages.cae.wisc.edu/~ece533/images/airplane.png";
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: Text("Image from Web"),
                                    content: Form(
                                      key: _url,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextFormField(
                                              controller: _urlController,
                                              keyboardType: TextInputType.text,
                                              obscureText: false,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              validator: (String value) {
                                                if (value.isEmpty) {
                                                  return "URL cannot be empty";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  labelText: "URL",
                                                  labelStyle: TextStyle(
                                                    color: primary,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: primary,
                                                      width: 3,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      primary)),
                                                  prefixIcon: Padding(
                                                    child: IconTheme(
                                                      data: IconThemeData(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                      child: Image.asset(
                                                        'img/url.png',
                                                        color: Colors.black,
                                                        height: 15,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: 30, right: 10),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      Icons.clear,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _urlController.text =
                                                            "";
                                                      });
                                                    },
                                                  )),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: RaisedButton(
                                                    highlightElevation: 0.0,
                                                    splashColor: Colors.white,
                                                    highlightColor: primary,
                                                    elevation: 0.0,
                                                    color: primary,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Text(
                                                      "Fetch",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_url.currentState
                                                            .validate()) {
                                                          urlOfImage =
                                                              _urlController
                                                                  .text;
                                                          forWebOnly.add(
                                                              Image.network(
                                                                  "$urlOfImage"));
                                                        }
                                                        return Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.0,
                                                ),
                                                Expanded(
                                                  child: RaisedButton(
                                                    highlightElevation: 0.0,
                                                    splashColor: Colors.white,
                                                    highlightColor: primary,
                                                    elevation: 0.0,
                                                    color: Colors.blue,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5.0),
                                                            child: Text(
                                                              "Browser",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _launchUrl(context);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              });
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

  _launchUrl(BuildContext context) async {
    const url = "https://www.google.com.pk/imghp?hl=en&tab=wi&ogbl";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'cannot launch url.. error in $url';
    }
  }

  _localImagesOnly(BuildContext context) {
    return _uploadedImages.length < 1
        ? Center(child: Image.asset("img/no_image.png"))
        : GridView.builder(
            itemCount: _uploadedImages.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: _uploadedImages[index],
                  child: Material(
                    child: InkWell(
                      child: GridTile(
                        child: Image.file(_uploadedImages[index]),
                      ),
                    ),
                  ),
                ),
              );
            });
  }

  _webImagesOnly(BuildContext context) {
    return forWebOnly.length < 1
        ? Center(child: Image.asset("img/no_image.png"))
        : GridView.builder(
            itemCount: forWebOnly.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: forWebOnly[index],
                  child: Material(
                    child: InkWell(
                      child: GridTile(
                        child: forWebOnly[index],
                      ),
                    ),
                  ),
                ),
              );
            });
  }
}
