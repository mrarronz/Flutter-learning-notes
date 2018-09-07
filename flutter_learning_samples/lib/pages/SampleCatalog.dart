import 'package:flutter/material.dart';
import './SampleCatalog/AnimatedListDemo.dart';
import './SampleCatalog/TabbedAppBarDemo.dart';
import './SampleCatalog/AppBarBottomWidget.dart';
import './SampleCatalog/BasicAppBarDemo.dart';
import './SampleCatalog/ExpansionTiles.dart';

class SampleCatalog extends StatelessWidget {

  final String title;
  final items = [
    "AnimatedList",
    "AppBar Bottom Widget",
    "Basic AppBar",
    "ExpansionTiles",
    "Tabbed AppBar"
  ];

  SampleCatalog({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = items.map((title) {
      return new ListTile(
        title: new Text(title),
        trailing: new Icon(Icons.chevron_right, color: Colors.redAccent),
        onTap: () {
          switch (title) {
            case 'AnimatedList':
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) =>new AnimatedListDemo()));
              break;
            case 'AppBar Bottom Widget':
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) =>new AppBarBottomWidget()));
              break;
            case 'Basic AppBar':
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) =>new BasicAppBarDemo()));
              break;
            case 'Tabbed AppBar':
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) =>new TabbedAppBarDemo(title: title)));
              break;
            case 'ExpansionTiles':
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) =>new ExpansionTiles()));
              break;
          }
        },
      );
    });
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Scrollbar(
        child: new ListView(
          children: listTiles.toList(),
        )
      )
    );
  }
}