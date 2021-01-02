import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/logo.dart';
import 'package:photography_ux/Widgets/clipper.dart';
import 'dashboard.dart';

class Choice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChoiceState();
  }
}

class ChoiceState extends State<Choice> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailControl = TextEditingController();
  TextEditingController _passwordControl = TextEditingController();
  TextEditingController _nameControl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color primary = Theme.of(context).primaryColor;
    var _formKey = GlobalKey<FormState>();
    var _formKeyForgot = GlobalKey<FormState>();
    var _blankFocusNode = FocusNode();

    void _loginSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                top: 10,
                                child: IconButton(
                                  onPressed: () {
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    Navigator.pop(context);
                                    _emailControl.clear();
                                    _passwordControl.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 30.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontSize: 41,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20, top: 60),
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: _emailControl,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Email ID";
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    hintText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Icon(Icons.email),
                                      ),
                                      padding:
                                          EdgeInsets.only(left: 30, right: 10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: primary,
                                      ),
                                      onPressed: () {
                                        _emailControl.text = '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: _passwordControl,
                                  obscureText: true,
                                  maxLength: 8,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Password";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    hintText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Icon(Icons.lock),
                                      ),
                                      padding:
                                          EdgeInsets.only(left: 30, right: 10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: primary,
                                      ),
                                      onPressed: () {
                                        _passwordControl.text = '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
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
                                    "LOGIN",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState.validate()) {
                                        if (_emailControl.text == "a@y.com" &&
                                            _passwordControl.text == "123") {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Dashboard(
                                                user: _emailControl.text);
                                          })).then((_) {
                                            _emailControl.text = "";
                                            _passwordControl.text = "";
                                          });
                                        } else {
                                          return _loginFail(context);
                                        }
                                      }
                                    });
                                  },
                                ),
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: GestureDetector(
                                child: Text(
                                  "Forgot Password ?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: primary,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Forgot Password"),
                                            content: Form(
                                              key: _formKeyForgot,
                                              child: Wrap(
                                                children: <Widget>[
                                                  TextFormField(
                                                    controller: _emailControl,
                                                    validator: (String value) {
                                                      if (value.isEmpty) {
                                                        return "Email ID is mandatory";
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: false,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    decoration: InputDecoration(
                                                      hintStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                      hintText: "Email ID",
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      prefixIcon: Padding(
                                                        child: IconTheme(
                                                          data: IconThemeData(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                          child: Icon(Icons
                                                              .account_circle),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30,
                                                                right: 10),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 50),
                                                    child: RaisedButton(
                                                      highlightElevation: 0.0,
                                                      splashColor: Colors.white,
                                                      highlightColor: primary,
                                                      elevation: 0.0,
                                                      color: primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Text(
                                                        "Reset Password",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        if (_formKeyForgot
                                                            .currentState
                                                            .validate()) {
                                                          Navigator.pop(
                                                              context);
                                                          _emailSent(context);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 1.12,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      });
    }

    void _registerSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                top: 10,
                                child: IconButton(
                                  onPressed: () {
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    Navigator.pop(context);
                                    _emailControl.clear();
                                    _passwordControl.clear();
                                    _nameControl.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 30.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 12, bottom: 22, right: 30),
                                      child: Text(
                                        "REGI",
                                        style: TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Positioned(
                                    child: Align(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: 40, left: 15),
                                        width: 130,
                                        child: Text(
                                          "STER",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 20,
                                top: 60,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: _nameControl,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Username is mandatory";
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    hintText: "Name",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Icon(Icons.account_circle),
                                      ),
                                      padding:
                                          EdgeInsets.only(left: 30, right: 10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: primary,
                                      ),
                                      onPressed: () {
                                        _nameControl.text = '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: _emailControl,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Email is mandatory";
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    hintText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Icon(Icons.email),
                                      ),
                                      padding:
                                          EdgeInsets.only(left: 30, right: 10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: primary,
                                      ),
                                      onPressed: () {
                                        _emailControl.text = '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: _passwordControl,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Password is mandatory";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    hintText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Icon(Icons.lock),
                                      ),
                                      padding:
                                          EdgeInsets.only(left: 30, right: 10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: primary,
                                      ),
                                      onPressed: () {
                                        _passwordControl.text = '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                child: RaisedButton(
                                  highlightElevation: 0.0,
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  elevation: 0.0,
                                  color: primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState.validate()) {
                                        _emailControl.text = "";
                                        _passwordControl.text = "";
                                        _nameControl.text = "";
                                        return _loginSheet();
                                      }
                                    });
                                  },
                                ),
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 1.1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      });
    }

    SystemChrome.setEnabledSystemUIOverlays([]);
    FlutterError.onError = null;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: WillPopScope(
          onWillPop: () => _showDialog(context),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  logo(context),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      child: RaisedButton(
                        highlightElevation: 0.0,
                        splashColor: primary,
                        highlightColor: Colors.white,
                        elevation: 0.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primary,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          _loginSheet();
                        },
                      ),
                      height: 50,
                    ),
                  ),
                  Padding(
                    child: Container(
                      child: OutlineButton(
                        highlightedBorderColor: Colors.white,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        highlightElevation: 0.0,
                        splashColor: Colors.white,
                        highlightColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          _registerSheet();
                        },
                      ),
                      height: 50,
                    ),
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: Align(
                      child: ClipPath(
                        child: Container(
                          color: Colors.white,
                          height: 300,
                        ),
                        clipper: BottomWaveClipper(),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Dashboard();
    }));
  }

  void navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Dashboard();
    }));
  }

  _showDialog(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to Quit ?"),
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
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  _emailSent(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Message"),
            content: Text("Password has been sent to your Email ID"),
          );
        });
  }

  _loginFail(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Message"),
            content: Text("Email or password is incorrect"),
          );
        });
  }
}
