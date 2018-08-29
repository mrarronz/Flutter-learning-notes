import 'package:flutter/material.dart';

class ListUsage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('List Usage')),
      body: _buildLongList(),
    );
  }

  Widget _buildBasicList() {
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Map'),
        ),
        new ListTile(
          leading: new Icon(Icons.photo),
          title: new Text('Album'),
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('Phone'),
        ),
      ],
    );
  }

  Widget _buildHorizontalList() {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 160.0,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildLongList() {
    final items = new List<String>.generate(1000, (i) => "Item $i");
    return new ListView.builder(
      itemBuilder: (context, index) {
        return new ListTile(
          title: new Text('${items[index]}'),
        );
      },
      itemCount: items.length,
    );
  }


}