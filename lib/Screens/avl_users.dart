import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/dashboard.dart';
import 'package:photography_ux/Screens/userList.dart';
import 'addClient.dart';

class AvlUsers extends StatefulWidget {
  String username;
  String phone;
  Image clientImage;

  AvlUsers({Key key, this.username, this.phone, this.clientImage})
      : super(key: key);

  @override
  _AvlUsersState createState() => _AvlUsersState(username, phone, clientImage);
}

class _AvlUsersState extends State<AvlUsers> {
  String username;
  String phone;
  Image clientImage;

  _AvlUsersState(this.username, this.phone, this.clientImage);

  List<String> getListItems() {
    var items = List.generate(
        username.length, (username) => "Username: ${this.username}");
    return items;
  }

  Widget getListView() {
    var listItems = getListItems();
    ListView listView = ListView.builder(
        itemCount: getListItems().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listItems[index]),
          );
        });
    return listView;
  }

  checkLength() {
    if (this.username != null) {
      return Container(
        child: Center(
            child: Text(
          "No Clients Yet",
          style: TextStyle(fontSize: 20.0),
        )),
      );
    } else {
      return getListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankNode = FocusNode();

    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: primary,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(
                                user: 'a@y.com',
                              )));
                });
              },
            ),
            title: Text("Clients")),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          elevation: 2.0,
          tooltip: "Add new",
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddClient();
              }));
            });
          },
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankNode);
          },
          child: Container(
            child: UsersList(
                username: username,
                phone: phone,
                chk: checkLength,
                clientImage: clientImage),
            // child: checkLength(),
          ),
        ),
      ),
    );
  }
}
