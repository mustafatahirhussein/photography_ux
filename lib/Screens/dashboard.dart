import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/choice.dart';
import 'ImagesList.dart';

class Dashboard extends StatefulWidget {
  final String user;

  Dashboard({Key key, @required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        primarySwatch: Colors.grey,
      ),
      home: WillPopScope(
          onWillPop: () {
            _showAlert(context);
          },
          child: ImagesListData(loginUser: widget.user)),
    );
  }

  _showAlert(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to SignOut ?"),
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
}
