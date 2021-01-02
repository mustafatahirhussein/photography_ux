import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/ImagesList.dart';
import 'package:photography_ux/Screens/sessionImageUploading.dart';
import 'package:photography_ux/Widgets/popup_items.dart';
import 'package:intl/intl.dart';

class Sessions extends StatefulWidget {
  String clientName;
  String clientCell;

  //get data from add sessions page
  String title, desc, note;

  Sessions({
    Key key,
    @required this.clientName,
    this.clientCell,
    this.title,
    this.desc,
    this.note,
  }) : super(key: key);

  @override
  _SessionsState createState() => _SessionsState(
      this.clientName, this.clientCell, this.title, this.desc, this.note);
}

class _SessionsState extends State<Sessions> {
  String clientName;
  String clientCell;

  //get data from add sessions page
  String title, desc, note;

  _SessionsState(
      this.clientName, this.clientCell, this.title, this.desc, this.note);

  // List<String> alphabetList;
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];

  //for dynamic data
  String formattedTime = DateFormat.jm().format(DateTime.now());
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());

  lengthOfSessions() {
    if (this.clientName == 'Amjad') {
      return 4;
    } else if (this.clientName == 'Mehmood') {
      return 6;
    } else if (this.clientName == 'Faisal Shah') {
      return 5;
    } else if (this.clientName == 'Noor Amin') {
      return 8;
    } else {
      return this.clientName == null ? 0 : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    BuildContext _builtContext;

    var _blankFocusNode = FocusNode();

    //for menu of appbar
    void UserChoice(String choice) {
      _builtContext = this.context;
      if (choice == Constants.close) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ImagesListData(loginUser: clientName)));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: clientName == null
            ? Text("Sessions")
            : Text("Sessions $clientName"),
        actions: <Widget>[
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
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: Center(
          child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: List.generate(
                lengthOfSessions(),
                (index) {
                  return ListViewCard(
                    alphabetList,
                    index,
                    Key('$index'),
                    clientName,
                    clientCell,
                    title,
                    desc,
                    note,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  final String clientName;
  final String clientCell;

  //get data from add sessions page
  String title, desc, note;

  ListViewCard(this.listItems, this.index, this.key, this.clientName,
      this.clientCell, this.title, this.desc, this.note);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime.now());
    String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Dismissible(
      key: UniqueKey(),
      child: SafeArea(
        child: widget.title == null ||
                widget.desc == null ||
                widget.note == null
            ? Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                margin: EdgeInsets.all(4),
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SessionUploadImage();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Title ${widget.listItems[widget.index]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  textAlign: TextAlign.left,
                                  maxLines: 5,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Description ${widget.listItems[widget.index]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.left,
                                  maxLines: 5,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Date $date, Time ${formattedTime.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                            icon: Image.asset(
                              "img/swipeIcon.png",
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                margin: EdgeInsets.all(4),
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SessionUploadImage();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Title ${widget.title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  textAlign: TextAlign.left,
                                  maxLines: 5,
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.topLeft,
                                  child: widget.note == ''
                                      ? Text(
                                          'Description ${widget.desc}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          textAlign: TextAlign.left,
                                          maxLines: 5,
                                        )
                                      : Row(
                                          children: <Widget>[
                                            Container(
                                                width: 75.0,
                                                child: Image.asset(
                                                  "img/note.png",
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  fit: BoxFit.cover,
                                                )),
                                            Expanded(
                                              child: Text(
                                                'Description ${widget.desc}\nNote ${widget.note}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                textAlign: TextAlign.left,
                                                maxLines: 5,
                                              ),
                                            ),
                                          ],
                                        )),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Date $date, Time ${formattedTime.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                            icon: Image.asset(
                              "img/swipeIcon.png",
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
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
