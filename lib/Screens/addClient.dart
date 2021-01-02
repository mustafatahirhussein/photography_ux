import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/avl_users.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AddClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddClientState();
  }
}

class AddClientState extends State<AddClient> {
  File image_file;

  TextEditingController _clientName = TextEditingController();
  MaskedTextController _phone = MaskedTextController(mask: '(0000)-0000000');
  var _formKey = GlobalKey<FormState>();

  _openGallery(BuildContext context) async {
    var picture =
        image_file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image_file = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture =
        image_file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image_file = picture;
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
    if (image_file == null) {
      return Image.asset("img/no_img.png", height: 170, width: 120);
    } else {
      return Image.file(image_file, height: 120, width: 120);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankFocusNode = FocusNode();
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text("Add Client"),
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocusNode);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 8, right: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _clientName,
                      obscureText: false,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Client is empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        labelText: "Client",
                        labelStyle: TextStyle(
                          color: primary,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: primary,
                            width: 3,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary)),
                        prefixIcon: Padding(
                          child: IconTheme(
                            data: IconThemeData(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(Icons.person),
                          ),
                          padding: EdgeInsets.only(left: 30, right: 10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear,color: primary,),onPressed: () {
                          _clientName.text = '';
                        },),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phone,
                      obscureText: false,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Phone# is empty';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          labelText: "Phone",
                          labelStyle: TextStyle(
                            color: primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: primary,
                              width: 3,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primary)),
                          prefixIcon: Padding(
                            child: IconTheme(
                              data: IconThemeData(
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(Icons.phone),
                            ),
                            padding: EdgeInsets.only(left: 30, right: 10),
                          ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear,color: primary,),onPressed: () {
                          _phone.text = '';
                        },),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: primary,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(21.0)),
                                  ),
                                  color: primary,
                                  child: Text(
                                    "Upload Picture",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _showDialog(context);
                                  },
                                ),
                                width: 10,
                                height: 80,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: _decideImage(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
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
                                Icons.person_add,
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  "Add",
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
                              if (_formKey.currentState.validate()) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AvlUsers(
                                    username: _clientName.text,
                                    phone: _phone.text,
                                    clientImage: image_file == null
                                        ? Image.asset("img/no_img.png")
                                        : Image.file(image_file),
                                  );
                                }));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Parameters Reqd."),
                                        content: Text(
                                          "Fields required",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                      );
                                    });
                              }
                            });
                          },
                        ),
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
