import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/addSession.dart';
import 'package:photography_ux/Screens/avl_users.dart';
import 'package:photography_ux/Screens/image_fill.dart';
import 'package:photography_ux/Screens/sessionPage.dart';
import 'package:photography_ux/Screens/settings.dart';
import 'package:photography_ux/Screens/uploadImage.dart';
import 'package:photography_ux/Screens/AssignImage.dart';
import 'aboutApp.dart';
import 'addClient.dart';
import 'choice.dart';

class ImagesListData extends StatefulWidget {
  String loginUser;

  ImagesListData({Key key, @required this.loginUser}) : super(key: key);

  @override
  _ImagesListDataState createState() => _ImagesListDataState();
}

class _ImagesListDataState extends State<ImagesListData> {
  final localImages = [
    {
      'pic': 'img/1.jpg',
    },
    {
      'pic': 'img/2.jpg',
    },
    {
      'pic': 'img/3.jpg',
    },
    {
      'pic': 'img/4.jpg',
    },
    {
      'pic': 'img/5.jpg',
    },
    {
      'pic': 'img/Poses/stand1.jpg',
    },
    {
      'pic': 'img/Poses/stand2.jpg',
    },
    {
      'pic': 'img/Poses/stand3.jpg',
    },
    {
      'pic': 'img/Poses/stand4.jpg',
    },
    {
      'pic': 'img/Poses/sit1.jpg',
    },
    {
      'pic': 'img/Poses/sit2.jpg',
    },
    {
      'pic': 'img/Poses/sit3.jpg',
    },
    {
      'pic': 'img/Poses/sit4.jpeg',
    },
    {
      'pic': 'img/Poses/pose1.jpg',
    },
    {
      'pic': 'img/Poses/pose2.jpg',
    },
    {
      'pic': 'img/Poses/pose3.jpg',
    },
    {
      'pic': 'img/Poses/pose4.jpg',
    },
    {
      'pic': 'img/Poses/pose5.jpg',
    },
    {
      'pic': 'img/Poses/pose6.jpg',
    },
    {
      'pic': 'img/Poses/pose7.jpg',
    },
    {
      'pic': 'img/Poses/lying1.jpg',
    },
    {
      'pic': 'img/Poses/lying2.jpg',
    },
    {
      'pic': 'img/Poses/lying3.jpg',
    },
    {
      'pic': 'img/Poses/lying4.jpg',
    },
    {
      'pic': 'img/Poses/lying5.jpg',
    },
  ];

  final imageSelection = [];
  bool isSelected = false;
  bool appbarCheck = false;

  //image title getting them manually
  Image imageFileSource;
  final getImageManual = [];

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    gridTileSelect() {
      return GridView.builder(
          itemCount: localImages.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Hero(
                tag: 'Image ${index + 1}',
                child: Material(
                  child: InkWell(
                    child: GridTile(
                      footer: Container(
                        child: ListTile(
                            leading: imageSelection.length < 1
                                ? Text(
                                    'Image ${index + 1}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Image ${index + 1}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                        child: Checkbox(
                                          value: imageSelection.contains(index)
                                              ? true
                                              : false,
                                          onChanged: (bool value) {
                                            setState(() {
                                              isSelected = value;
                                              print(value);
                                              if (imageSelection
                                                  .contains(index)) {
                                                imageSelection.remove(index);
                                                print(imageSelection);
                                              } else {
                                                imageSelection.add(index);
                                                print(imageSelection);
                                              }
                                            });
                                          },
                                          checkColor: Colors.white,
                                          activeColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                      child: Image.asset(
                        localImages[index]['pic'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    onLongPress: () {
                      setState(() {
                        isSelected = true;
                        imageSelection.add(index);
                        print(imageSelection);

                        if (imageSelection.length >= 1) {
                          print("yes");
                          OpenBottomSheet(index);
                        }
                      });
                    },
                    onTap: () {
                      setState(() {
                        if (isSelected == false) {
                          print(isSelected);
                          if (imageSelection.length < 1) {
                            appbarCheck = false;

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ImageFill(
                                image: localImages[index]['pic'],
                                iname: 'Image ${index + 1}',
                              );
                            }));
                          } else {
                            if (imageSelection.contains(index)) {
                              imageSelection.remove(index);
                              print(imageSelection);
                            } else {
                              imageSelection.add(index);
                              print(imageSelection);
                            }
                            isSelected = false;
                            appbarCheck = false;
                          }
                        } else {
                          if (imageSelection.contains(index)) {
                            imageSelection.remove(index);
                            print(imageSelection);
                          } else {
                            imageSelection.add(index);
                            print(imageSelection);
                          }
                          isSelected = false;
                          appbarCheck = false;
                        }
                      });
                    },
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: imageSelection.length < 1
          ? AppBar(
              title: Text("Image menu"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 30,
                  ),
                  tooltip: 'Clients',
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AvlUsers();
                      }));
                    });
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    "img/session.png",
                    color: Colors.white,
                  ),
                  tooltip: 'Add Session',
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddSession(
                          clientName: widget.loginUser,
                        );
                      }));
                    });
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    "img/logout.png",
                    color: Colors.red,
                  ),
                  tooltip: 'LogOut',
                  onPressed: () {
                    setState(() {
                      _showAlert(context);
                    });
                  },
                ),
              ],
            )
          : AppBar(
              title: appbarCheck == true
                  ? Text('All Selected')
                  : Text('${imageSelection.length} Selected'),
              leading: new Container(
                child: CircularCheckBox(
                  activeColor: Colors.red,
                  inactiveColor: Colors.white,
                  value: appbarCheck,
                  onChanged: (val) {
                    setState(() {
                      appbarCheck = val;
                      storeImageManually();
                      if (appbarCheck == true) {
                        OpenBottomSheet(0);
                      } else {
                        appbarCheck = false;
                        isSelected = false;
                        print('');
                      }
                    });
                  },
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 120,
                    child: RaisedButton(
                      highlightElevation: 0.0,
                      splashColor: Colors.white,
                      highlightColor: primary,
                      elevation: 0.0,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          isSelected = false;
                          appbarCheck = false;
                          imageSelection.removeRange(0, imageSelection.length);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            Container(
              height: 220,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black38,
                      new Color(0x516d3e),
                    ],
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "img/2.jpg",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.loginUser,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            CustomListTile(
              icon: Icons.person,
              title: 'Add Client',
              fontWeight: FontWeight.bold,
              loginUser: widget.loginUser,
            ),
            SizedBox(height: 8.0),
            CustomListTile(
              icon: Icons.camera_alt,
              title: 'Upload Picture',
              fontWeight: FontWeight.bold,
              loginUser: widget.loginUser,
            ),
            SizedBox(height: 8.0),
            CustomListTile(
              icon: Icons.assessment,
              title: 'My Sessions',
              fontWeight: FontWeight.bold,
              loginUser: widget.loginUser,
            ),
            SizedBox(height: 8.0),
            CustomListTile(
              icon: Icons.settings,
              title: 'Settings',
              fontWeight: FontWeight.bold,
              loginUser: widget.loginUser,
            ),
            SizedBox(height: 8.0),
            CustomListTile(
              icon: Icons.apps,
              title: 'About App',
              fontWeight: FontWeight.bold,
              loginUser: widget.loginUser,
            ),
            SignOut(Icons.lock, Colors.red, "LogOut", FontWeight.bold),
          ],
        ),
      ),
      body: gridTileSelect(),
    );
  }

  storeImageManually() async {
    if (appbarCheck == true) {
      var p1 = imageFileSource = await Image.asset('img/1.jpg');
      var p2 = imageFileSource = await Image.asset('img/2.jpg');
      var p3 = imageFileSource = await Image.asset('img/3.jpg');
      var p4 = imageFileSource = await Image.asset('img/4.jpg');
      var p5 = imageFileSource = await Image.asset('img/5.jpg');
      var p6 = imageFileSource = await Image.asset('img/Poses/lying1.jpg');
      var p7 = imageFileSource = await Image.asset('img/Poses/lying2.jpg');
      var p8 = imageFileSource = await Image.asset('img/Poses/lying3.jpg');
      var p9 = imageFileSource = await Image.asset('img/Poses/lying4.jpg');
      var p10 = imageFileSource = await Image.asset('img/Poses/lying5.jpg');
      var p11 = imageFileSource = await Image.asset('img/Poses/pose1.jpg');
      var p12 = imageFileSource = await Image.asset('img/Poses/pose2.jpg');
      var p13 = imageFileSource = await Image.asset('img/Poses/pose3.jpg');
      var p14 = imageFileSource = await Image.asset('img/Poses/pose4.jpg');
      var p15 = imageFileSource = await Image.asset('img/Poses/pose5.jpg');
      var p16 = imageFileSource = await Image.asset('img/Poses/pose6.jpg');
      var p17 = imageFileSource = await Image.asset('img/Poses/pose7.jpg');
      var p18 = imageFileSource = await Image.asset('img/Poses/sit1.jpg');
      var p19 = imageFileSource = await Image.asset('img/Poses/sit2.jpg');
      var p20 = imageFileSource = await Image.asset('img/Poses/sit3.jpg');
      var p21 = imageFileSource = await Image.asset('img/Poses/sit4.jpeg');
      var p22 = imageFileSource = await Image.asset('img/Poses/stand1.jpg');
      var p23 = imageFileSource = await Image.asset('img/Poses/stand2.jpg');
      var p24 = imageFileSource = await Image.asset('img/Poses/stand3.jpg');
      var p25 = imageFileSource = await Image.asset('img/Poses/stand4.jpg');

      getImageManual.add(p1);
      getImageManual.add(p2);
      getImageManual.add(p3);
      getImageManual.add(p4);
      getImageManual.add(p5);
      getImageManual.add(p6);
      getImageManual.add(p7);
      getImageManual.add(p8);
      getImageManual.add(p9);
      getImageManual.add(p10);
      getImageManual.add(p11);
      getImageManual.add(p12);
      getImageManual.add(p13);
      getImageManual.add(p14);
      getImageManual.add(p15);
      getImageManual.add(p16);
      getImageManual.add(p17);
      getImageManual.add(p18);
      getImageManual.add(p19);
      getImageManual.add(p20);
      getImageManual.add(p21);
      getImageManual.add(p22);
      getImageManual.add(p23);
      getImageManual.add(p24);
      getImageManual.add(p25);

      //select all imageSelection list items

      imageSelection.removeRange(0, imageSelection.length);

      imageSelection.add(0);
      imageSelection.add(1);
      imageSelection.add(2);
      imageSelection.add(3);
      imageSelection.add(4);
      imageSelection.add(5);
      imageSelection.add(6);
      imageSelection.add(7);
      imageSelection.add(8);
      imageSelection.add(9);
      imageSelection.add(10);
      imageSelection.add(11);
      imageSelection.add(12);
      imageSelection.add(13);
      imageSelection.add(14);
      imageSelection.add(15);
      imageSelection.add(16);
      imageSelection.add(17);
      imageSelection.add(18);
      imageSelection.add(19);
      imageSelection.add(20);
      imageSelection.add(21);
      imageSelection.add(22);
      imageSelection.add(23);
      imageSelection.add(24);

      print(imageSelection);

//      Navigator.of(context).push(MaterialPageRoute(
//          builder: (context) => aaa(
//                image: getImageManual,
//              )));
    } else {
      print("value is false");

      imageSelection.removeRange(0, imageSelection.length);
      getImageManual.removeRange(0, getImageManual.length);
      print(imageSelection);
      print(getImageManual);
    }
  }

  OpenBottomSheet(int index) {
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
              height: 160.0,
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
                            Icons.assignment_ind,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Assign to Client",
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
                          isSelected = false;
                          getImageManual.add(Image.asset(
                            localImages[index]['pic'],
                            fit: BoxFit.cover,
                          ));
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AssignImage(imageData: getImageManual);
                          }));
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
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Cancel",
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
                          isSelected = false;
                          imageSelection.removeRange(0, imageSelection.length);
                          Navigator.pop(context);
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
                            Icons.remove_circle,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Remove",
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
                          isSelected = false;
                          imageSelection.remove(index);
                          localImages.remove(localImages[index]['pic']);
                          print(localImages);
                          print(imageSelection);
                          Navigator.pop(context);
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
}

class CustomListTile extends StatelessWidget {
  String title;
  IconData icon;
  FontWeight fontWeight;
  String loginUser;

//  CustomListTile(this.icon, this.title, this.fontWeight);
  CustomListTile(
      {Key key,
      @required this.icon,
      this.title,
      this.fontWeight,
      this.loginUser});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankFocusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_blankFocusNode);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black87)),
          ),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontSize: 20, fontWeight: fontWeight),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            splashColor: Colors.black12,
            onTap: () {
              Navigator.pop(context);
              if (title == 'Add Client') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddClient();
                }));
              } else if (title == 'Upload Picture') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UploadImage();
                }));
              } else if (title == 'My Sessions') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Sessions(
                    clientName: loginUser,
                  );
                }));
              } else if (title == 'Settings') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              } else if (title == 'About App') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutApp();
                }));
              }
            },
          ),
        ),
      ),
    );
  }
}

class SignOut extends StatelessWidget {
  String title;
  Color color;
  IconData icon;
  FontWeight fontWeight;

  SignOut(this.icon, this.color, this.title, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Container(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          splashColor: Colors.red,
          onTap: () {
            _showAlert(context);
          },
        ),
      ),
    );
  }
}

_showAlert(BuildContext context) {
  Color primary = Theme.of(context).primaryColor;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to LogOut ?"),
          actions: <Widget>[
            FlatButton(
              color: primary,
              child: Text(
                "No ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              color: primary,
              child: Text(
                "Yes ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Choice();
                }));
              },
            ),
          ],
        );
      });
}
