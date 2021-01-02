import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:photography_ux/Screens/sessionPage.dart';
import 'package:photography_ux/Screens/userAssignImage.dart';

class UsersList extends StatefulWidget {
  String username;
  String phone;
  Function chk;
  Image clientImage;

  UsersList({Key key, this.username, this.phone, this.chk, this.clientImage})
      : super(key: key);

  @override
  _UsersListState createState() =>
      _UsersListState(username, phone, chk, clientImage);
}

class _UsersListState extends State<UsersList> {
  String formattedTime = DateFormat.jm().format(DateTime.now());
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());

  String username;
  String phone;
  Function chk;
  Image clientImage;

  _UsersListState(this.username, this.phone, this.chk, this.clientImage);

  //for sessions only
  String clientName, clientCell;

  List<String> _names = ["Amjad", "Mehmood", "Faisal Shah", "Noor Amin"];
  List<String> _mobile = ["021435464", "021546643", "0214354464", "021435464"];

  loadList() {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 1, right: 1, bottom: 12),
              child: ListTile(
                title: Text("${_names[0]}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(
                  "${_mobile[0]}\nDate $date, Time ${formattedTime.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("img/1.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                contentPadding: EdgeInsets.only(left: 3.0, right: 3.0),
                trailing: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: Expanded(
                        child: RaisedButton.icon(
                          highlightElevation: 0.0,
                          splashColor: Colors.white,
                          highlightColor: Colors.black,
                          elevation: 0.0,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserImageAssign(
                                localUser:
                                    clientName == null ? 'User' : _names[0],
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Assign',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    clientName = _names[0];
                    clientCell = _mobile[0];

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Sessions(
                        clientName: clientName,
                        clientCell: clientCell,
                      );
                    }));
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 1, right: 1, bottom: 12),
              child: ListTile(
                title: Text("${_names[1]}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(
                  "${_mobile[1]}\nDate $date, Time ${formattedTime.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("img/2.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                contentPadding: EdgeInsets.only(left: 3.0, right: 3.0),
                trailing: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: Expanded(
                        child: RaisedButton.icon(
                          highlightElevation: 0.0,
                          splashColor: Colors.white,
                          highlightColor: Colors.black,
                          elevation: 0.0,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserImageAssign(
                                localUser:
                                    clientName == null ? 'User' : _names[1],
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Assign',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    clientName = _names[1];
                    clientCell = _mobile[1];

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Sessions(
                        clientName: clientName,
                        clientCell: clientCell,
                      );
                    }));
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 1, right: 1, bottom: 12),
              child: ListTile(
                title: Text("${_names[2]}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(
                  "${_mobile[2]}\nDate $date, Time ${formattedTime.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("img/portrait.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                contentPadding: EdgeInsets.only(left: 3.0, right: 3.0),
                trailing: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: Expanded(
                        child: RaisedButton.icon(
                          highlightElevation: 0.0,
                          splashColor: Colors.white,
                          highlightColor: Colors.black,
                          elevation: 0.0,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserImageAssign(
                                localUser:
                                    clientName == null ? 'User' : _names[2],
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Assign',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    clientName = _names[2];
                    clientCell = _mobile[2];

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Sessions(
                        clientName: clientName,
                        clientCell: clientCell,
                      );
                    }));
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 1, right: 1, bottom: 12),
              child: ListTile(
                title: Text("${_names[3]}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(
                  "${_mobile[3]}\nDate $date, Time ${formattedTime.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("img/5.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                contentPadding: EdgeInsets.only(left: 3.0, right: 3.0),
                trailing: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: Expanded(
                        child: RaisedButton.icon(
                          highlightElevation: 0.0,
                          splashColor: Colors.white,
                          highlightColor: Colors.black,
                          elevation: 0.0,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserImageAssign(
                                localUser:
                                    clientName == null ? 'User' : _names[3],
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Assign',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    clientName = _names[3];
                    clientCell = _mobile[3];

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Sessions(
                        clientName: clientName,
                        clientCell: clientCell,
                      );
                    }));
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  listChecker() {
    if (this.username != null) {
      return Container(
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.black, width: 2),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 1, right: 1, bottom: 12),
            child: ListTile(
              title: Text("$username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text(
                  "$phone\nDate $date, Time ${formattedTime.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: CircleAvatar(
                radius: 30,
                child: Container(
                  height: 100,
                  width: 120,
                  child: ClipOval(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: clientImage != clientImage
                          ? Image(image: AssetImage("img/no_img.png"))
                          : clientImage,
                    ),
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(left: 3.0, right: 3.0),
              trailing: Column(
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    child: Expanded(
                      child: RaisedButton.icon(
                        highlightElevation: 0.0,
                        splashColor: Colors.white,
                        highlightColor: Colors.black,
                        elevation: 0.0,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserImageAssign(
                              localUser:
                                  clientName == null ? 'User' : clientName,
                            );
                          }));
                        },
                        icon: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Assign',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  clientName = username;
                  clientCell = phone;

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Sessions(
                      clientName: clientName,
                      clientCell: clientCell,
                    );
                  }));
                });
              },
            ),
          ),
        ),
      );
    }
  }

  functionToCheckIfBothListTileExists() {
    return loadList();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      child: ListView(
        children: <Widget>[
          Center(
            child: listChecker(),
          ),
          Center(
            child: functionToCheckIfBothListTileExists(),
          ),
        ],
      ),
    );
  }

  Widget loadedList() {
    loadList();
  }
}
