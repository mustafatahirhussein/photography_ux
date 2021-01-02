import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primary,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: Center(
          child: Text(
            "About App Page...",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
