import 'package:flutter/material.dart';

class ListUsage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('List Usage')),
      body: _buildListViewWithDifferentCells(context),
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

  Widget _buildGridList(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      children: new List.generate(100, (index) {
        return new Center(
          child: new Text('Item $index', style: Theme.of(context).textTheme.headline,),
        );
      }),
    );
  }

  Widget _buildListViewWithDifferentCells(BuildContext context) {
    final items = new List<ListItem>.generate(1000, (index) {
      return index % 6 == 0 ? new HeadingItem("Heading $index") : new MessageItem("Sender $index", "Message body $index");
    });
    return new ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeadingItem) {
          return new ListTile(
            title: new Text(item.heading, style: Theme.of(context).textTheme.headline),
          );
        }
        else if (item is MessageItem) {
          return new ListTile(
            title: new Text(item.sender),
            subtitle: new Text(item.body),
          );
        }
      },
      itemCount: items.length,
    );
  }
}

abstract class ListItem{}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}

