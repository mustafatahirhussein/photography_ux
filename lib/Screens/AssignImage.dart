import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:photography_ux/Screens/assignImage2.dart';

class AssignImage extends StatefulWidget {
  List imageData;

  AssignImage({Key key, @required this.imageData}) : super(key: key);

  @override
  _AssignImageState createState() => _AssignImageState(imageData);
}

class _AssignImageState extends State<AssignImage> {
  String formattedTime = DateFormat.jm().format(DateTime.now());
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());

  List<String> _names = ["Amjad", "Mehmood", "Faisal Shah", "Noor Amin"];
  List<String> _mobile = ["021435464", "021546643", "0214354464", "021435464"];

  List imageData;

  _AssignImageState(this.imageData);

  bool isSelected1 = false,
      isSelected2 = false,
      isSelected3 = false,
      isSelected4 = false;
  final _users = [];

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
                trailing: Checkbox(
                  value: isSelected1,
                  onChanged: (val) {
                    setState(() {
                      isSelected1 = val;
                      if (isSelected1 == true)
                        _users.add(1);
                      else
                        _users.remove(1);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                ),
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
                trailing: Checkbox(
                  value: isSelected2,
                  onChanged: (val) {
                    setState(() {
                      isSelected2 = val;
                      if (isSelected2 == true)
                        _users.add(2);
                      else
                        _users.remove(2);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                ),
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
                trailing: Checkbox(
                  value: isSelected3,
                  onChanged: (val) {
                    setState(() {
                      isSelected3 = val;
                      if (isSelected3 == true)
                        _users.add(3);
                      else
                        _users.remove(3);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                ),
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
                trailing: Checkbox(
                  value: isSelected4,
                  onChanged: (val) {
                    setState(() {
                      isSelected4 = val;
                      if (isSelected4 == true)
                        _users.add(4);
                      else
                        _users.remove(4);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  functionToCheckIfBothListTileExists() {
    return loadList();
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Assign"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Center(
              child: functionToCheckIfBothListTileExists(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            if (_users.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Message"),
                      content: Text(
                        "You have not selected any client(s)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    );
                  });
            } else {
              if (isSelected1 == true) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserImageAssign2(
                          localUser: _names[0],
                          imageData: imageData,
                        )));
              }
              if (isSelected2 == true) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserImageAssign2(
                          localUser: _names[1],
                          imageData: imageData,
                        )));
              }
              if (isSelected3 == true) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserImageAssign2(
                          localUser: _names[2],
                          imageData: imageData,
                        )));
              }
              if (isSelected4 == true) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserImageAssign2(
                          localUser: _names[3],
                          imageData: imageData,
                        )));
              } else {
              }
            }
          });
        },
      ),
    );
  }

  Widget loadedList() {
    loadList();
  }
}
