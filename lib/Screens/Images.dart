import 'package:flutter/material.dart';
import 'package:photography_ux/Screens/image_fill.dart';

class ImagePage extends StatefulWidget {
  String clientName;
  String clientCell;
  List<String> listItems;
  int index;

  ImagePage(
      {Key key,
      @required this.clientName,
      this.clientCell,
      this.listItems,
      this.index})
      : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState(
      this.clientName, this.clientCell, this.listItems, this.index);
}

class _ImagePageState extends State<ImagePage> {
  String clientName;
  String clientCell;
  final List<String> listItems;
  final int index;

  _ImagePageState(this.clientName, this.clientCell, this.listItems, this.index);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    //IMAGES
    final standing = [
      {
        'name': 'Image 1',
        'pic': 'img/Poses/stand1.jpg',
      },
      {
        'name': 'Image 2',
        'pic': 'img/Poses/stand2.jpg',
      },
      {
        'name': 'Image 3',
        'pic': 'img/Poses/stand3.jpg',
      },
      {
        'name': 'Image 4',
        'pic': 'img/Poses/stand4.jpg',
      },
    ];

    final sitting = [
      {
        'name': 'Image 1',
        'pic': 'img/Poses/sit1.jpg',
      },
      {
        'name': 'Image 2',
        'pic': 'img/Poses/sit2.jpg',
      },
      {
        'name': 'Image 3',
        'pic': 'img/Poses/sit3.jpg',
      },
      {
        'name': 'Image 4',
        'pic': 'img/Poses/sit4.jpeg',
      },
    ];

    final pose = [
      {
        'name': 'Image 1',
        'pic': 'img/Poses/pose1.jpg',
      },
      {
        'name': 'Image 2',
        'pic': 'img/Poses/pose2.jpg',
      },
      {
        'name': 'Image 3',
        'pic': 'img/Poses/pose3.jpg',
      },
      {
        'name': 'Image 4',
        'pic': 'img/Poses/pose4.jpg',
      },
      {
        'name': 'Image 5',
        'pic': 'img/Poses/pose5.jpg',
      },
      {
        'name': 'Image 6',
        'pic': 'img/Poses/pose6.jpg',
      },
      {
        'name': 'Image 7',
        'pic': 'img/Poses/pose7.jpg',
      },
    ];

    final lye = [
      {
        'name': 'Image 1',
        'pic': 'img/Poses/lying1.jpg',
      },
      {
        'name': 'Image 2',
        'pic': 'img/Poses/lying2.jpg',
      },
      {
        'name': 'Image 3',
        'pic': 'img/Poses/lying3.jpg',
      },
      {
        'name': 'Image 4',
        'pic': 'img/Poses/lying4.jpg',
      },
      {
        'name': 'Image 5',
        'pic': 'img/Poses/lying5.jpg',
      },
    ];

    gridTileSelect() {
      if (widget.listItems[widget.index] == 'Standing') {
        return GridView.builder(
            itemCount: standing.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: standing[index]['name'],
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageFill(
                              image: standing[index]['pic'],
                              iname: standing[index]['name']);
                        }));
                      },
                      child: GridTile(
                        footer: Container(
                          child: ListTile(
                            leading: Text(
                              standing[index]['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          standing[index]['pic'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      } else if (widget.listItems[widget.index] == 'Sitting') {
        return GridView.builder(
            itemCount: sitting.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: sitting[index]['name'],
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageFill(
                              image: sitting[index]['pic'],
                              iname: sitting[index]['name']);
                        }));
                      },
                      child: GridTile(
                        footer: Container(
                          child: ListTile(
                            leading: Text(
                              sitting[index]['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          sitting[index]['pic'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      } else if (widget.listItems[widget.index] == 'Posing') {
        return GridView.builder(
            itemCount: pose.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: pose[index]['name'],
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageFill(
                              image: pose[index]['pic'],
                              iname: pose[index]['name']);
                        }));
                      },
                      child: GridTile(
                        footer: Container(
                          child: ListTile(
                            leading: Text(
                              pose[index]['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          pose[index]['pic'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      } else if (widget.listItems[widget.index] == 'Lying') {
        return GridView.builder(
            itemCount: lye.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Hero(
                  tag: lye[index]['name'],
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageFill(
                              image: lye[index]['pic'],
                              iname: lye[index]['name']);
                        }));
                      },
                      child: GridTile(
                        footer: Container(
                          child: ListTile(
                            leading: Text(
                              lye[index]['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          lye[index]['pic'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Category(s)"),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: gridTileSelect() == null
          ? Center(
              child: Text("No Image found!", style: TextStyle(fontSize: 20.0)),
            )
          : gridTileSelect(),
    );
  }
}
