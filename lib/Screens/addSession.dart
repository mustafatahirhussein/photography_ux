import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/sessionPage.dart';
import 'package:photography_ux/Widgets/date_time_pickers.dart';
import 'package:flutter/widgets.dart';

class AddSession extends StatefulWidget {
  String clientName;

  AddSession({Key key, @required this.clientName}) : super(key: key);

  @override
  _AddSessionState createState() => _AddSessionState(this.clientName);
}

class _AddSessionState extends State<AddSession> {
  String clientName;

  _AddSessionState(this.clientName);

  final _sessionTitle = TextEditingController();
  final _desc = TextEditingController();
  final _note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays([]);
    var _formKey = GlobalKey<FormState>();

    var _blankFocusNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add new"),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "img/session.png",
              color: Colors.white,
            ),
            tooltip: 'View Sessions',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Sessions(clientName: clientName);
              }));
            },
          ),
        ],
        backgroundColor: primary,
      ),
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    // controller: convert(),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    enabled: false,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      labelText: "$clientName",
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
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _sessionTitle,
                    obscureText: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Title is empty';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        labelText: "Title",
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
                            child: Icon(Icons.title),
                          ),
                          padding: EdgeInsets.only(left: 30, right: 10),
                        ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear,color: primary,),onPressed: () {
                        _sessionTitle.text = '';
                      },),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Description is empty';
                      }
                      return null;
                    },
                    maxLength: 75,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: _desc,
                    decoration: InputDecoration(
                        labelText: "Description",
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
                            child: Icon(Icons.description),
                          ),
                          padding: EdgeInsets.only(left: 30, right: 10),
                        ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear,color: primary,),onPressed: () {
                        _desc.text = '';
                      },),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DateTimeForm(),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    maxLength: 50,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: _note,
                    decoration: InputDecoration(
                      labelText: "Add a Note...",
                      labelStyle: TextStyle(
                        color: primary,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: primary,
                          width: 1,
                        ),
                      ),
                      prefixIcon: Padding(
                        child: IconTheme(
                          data: IconThemeData(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Image.asset(
                            'img/note.png',
                            width: 40,
                          ),
                        ),
                        padding: EdgeInsets.only(left: 30, right: 10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear,color: primary,),onPressed: () {
                        _note.text = '';
                      },),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
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
                              return Sessions(
                                clientName: clientName,
                                title: _sessionTitle.text,
                                desc: _desc.text,
                                note: _note.text,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
