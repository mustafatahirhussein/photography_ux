import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Widgets/popup_items.dart';
import 'dart:math';
import 'Images.dart';

class SessionCategories extends StatefulWidget {
  String clientName;
  String clientCell;

  SessionCategories({
    Key key,
    @required this.clientName,
    this.clientCell,
  }) : super(key: key);

  @override
  _SessionCategoriesState createState() => _SessionCategoriesState(
        this.clientName,
        this.clientCell,
      );
}

class _SessionCategoriesState extends State<SessionCategories> {
  String clientName;
  String clientCell;

  _SessionCategoriesState(this.clientName, this.clientCell);

  TextEditingController _categoryController = TextEditingController();
  List<String> alphabetList = [
    'Standing',
    'Sitting',
    'Posing',
    'Jumping',
    'Lying',
    'Travel',
    'Portrait',
    'Fashion',
    'Sports',
    'Aerial'
  ];

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    var _formCategoryKey = GlobalKey<FormState>();

    SystemChrome.setEnabledSystemUIOverlays([]);
    //for menu of appbar
    BuildContext _builtContext;
    var _blankFocusNode = FocusNode();

    void UserChoice(String choice) {
      _builtContext = this.context;
      if (choice == Category.addCategory) {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_blankFocusNode);
                },
                child: Form(
                  key: _formCategoryKey,
                  child: AlertDialog(
                    title: Text("Add Category"),
                    content: TextFormField(
                      controller: _categoryController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Category cannot be empty";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Category title",
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
                              child: Icon(Icons.category),
                            ),
                            padding: EdgeInsets.only(left: 30, right: 10),
                          )),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        color: primary,
                        child: Text(
                          "Add ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formCategoryKey.currentState.validate()) {
                              alphabetList.add(_categoryController.text);

                              _categoryController.text = "";
                              Navigator.pop(context);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
      } else if (choice == Category.close) {
        Navigator.pop(_builtContext);
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Image Gallery"),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: UserChoice,
            itemBuilder: (BuildContext context) {
              return Category.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: ReorderableListView(
            onReorder: _onReorder,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: List.generate(
              alphabetList.length,
              (index) {
                return ListViewCard(
                  alphabetList,
                  index,
                  Key('$index'),
                  clientName,
                  clientCell,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  final String clientName;
  final String clientCell;

  ListViewCard(
      this.listItems, this.index, this.key, this.clientName, this.clientCell);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  String note_add = "";
  var _noteKey = GlobalKey<FormState>();
  var _noteControl = TextEditingController();
  var _blankFocusNode = FocusNode();

  randomNoGen() {
    int min = 1, max = 101;
    var random = Random();

    var randomNo = min + random.nextInt(max - min);
    return randomNo;
  }

  ShowCatImages() {
    if (widget.listItems[widget.index] == 'Standing') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/1.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Sitting') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/Poses/sit1.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Jumping') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/2.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Lying') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/Poses/lying5.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Posing') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/Poses/pose7.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Travel') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/2.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Portrait') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/portrait.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Fashion') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/fashion.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Sports') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/sports.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else if (widget.listItems[widget.index] == 'Aerial') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "img/aerial.jpg",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 30,
        child: Icon(Icons.person),
        backgroundColor: Colors.blue,
      );
    }
  }

  _showDialogBox() {
    Color primary = Theme.of(context).primaryColor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocusNode);
            },
            child: Form(
              key: _noteKey,
              child: AlertDialog(
                title: Text("Add a Note"),
                content: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  controller: _noteControl,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Note field cannot be empty";
                    }
                  },
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 3,
                  maxLength: 50,
                  decoration: InputDecoration(
                      labelText: "Note...",
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
                          child: Icon(Icons.note),
                        ),
                        padding: EdgeInsets.only(left: 30, right: 10),
                      )),
                ),
                actions: <Widget>[
                  RaisedButton(
                    color: primary,
                    child: Text(
                      "Add ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_noteKey.currentState.validate()) {
                          note_add = _noteControl.text;
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _showDialogBox();
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black, width: 2)),
        margin: EdgeInsets.all(4),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ImagePage(
                  clientName: widget.clientName,
                  clientCell: widget.clientCell,
                  listItems: widget.listItems,
                  index: widget.index,
                );
              }));
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 12.0, top: 6.0),
                        child: ShowCatImages(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(left: 12.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${widget.listItems[widget.index]} $note_add',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.left,
                        maxLines: 5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(left: 12.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Total Images: ${randomNoGen()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.left,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
