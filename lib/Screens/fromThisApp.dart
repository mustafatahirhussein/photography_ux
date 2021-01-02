import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:photography_ux/Screens/assignImage2.dart';
import 'package:photography_ux/Widgets/popup_items.dart';

class FromThisApp extends StatefulWidget {
  @override
  _FromThisAppState createState() => _FromThisAppState();
}

class _FromThisAppState extends State<FromThisApp> {
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

    var a;

    BuildContext _builtContext;

    //for menu of appbar
    void UserChoice(String choice) {
      _builtContext = this.context;

      if (choice == Constants.close) {
        Navigator.of(context).pop();
      }
    }

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
                          leading: Checkbox(
                            value:
                                imageSelection.contains(index) ? true : false,
                            onChanged: (bool value) {
                              setState(() {
                                isSelected = value;

                                if (imageSelection.contains(index)) {
                                  imageSelection.remove(index);
                                } else {
                                  imageSelection.add(index);
                                }
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        a = localImages[index]['pic'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    onLongPress: () {
                      setState(() {
                        isSelected = true;
                        imageSelection.add(index);

                        if (imageSelection.length >= 1) {
//                          OpenBottomSheet(index);
                        }
                      });
                    },
                    onTap: () {
                      setState(() {
                        if (imageSelection.contains(index)) {
                          imageSelection.remove(index);
                        } else {
                          imageSelection.add(index);
                        }
                        isSelected = false;
                        appbarCheck = false;
                      });
                    },
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
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
//                  OpenBottomSheet(0);
                } else {}
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
                disabledColor: Colors.grey,
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
                onPressed: appbarCheck == false
                    ? null
                    : () {
                        setState(() {
                          isSelected = false;
                          appbarCheck = false;
                          imageSelection.removeRange(0, imageSelection.length);
                        });
                      },
              ),
            ),
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
      ),
      body: gridTileSelect(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: imageSelection.length == 0
            ? null
            : () {
                setState(() {
                  appbarCheck = true;
                  getImageManual.add(Image.asset('$a'));

                  if (getImageManual.length > 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UserImageAssign2(
                        localUser: 'User',
                        imageData: getImageManual,
                      );
                    })).then((val) {
                      getImageManual.removeRange(0, getImageManual.length);
                      appbarCheck = false;
                      imageSelection.removeRange(0, imageSelection.length);
                      localImages.removeRange(0, localImages.length);
                      a = null;
                      print(a);
                    });
                  }
                });
              },
      ),
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
    } else {
      imageSelection.removeRange(0, imageSelection.length);
      getImageManual.removeRange(0, getImageManual.length);
    }
  }
}
