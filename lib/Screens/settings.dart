import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  var avl_lang = [
    'English(US)',
    'Urdu',
    'Arabic',
    'Chinese(Simplified)',
    'French'
  ];
  var _currentLanguage = "English(US)";

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
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
        child: Padding(
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  child: RaisedButton(
                    highlightElevation: 0.0,
                    splashColor: Colors.white,
                    highlightColor: primary,
                    elevation: 0.0,
                    color: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Change Theme",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  height: 50,
                ),
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Current language: English(US)",
                ),
              ),
              DropdownButton<String>(
                items: avl_lang.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    this._currentLanguage = newValue;
                  });
                },
                value: _currentLanguage,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  child: RaisedButton(
                    highlightElevation: 0.0,
                    splashColor: Colors.white,
                    highlightColor: primary,
                    elevation: 0.0,
                    color: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
