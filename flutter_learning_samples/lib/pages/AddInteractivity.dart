import 'package:flutter/material.dart';

class AddInteractivity extends StatelessWidget {

  final listItems = [
    {"title": "First demo", "image": Icons.looks_one},
    {"title": "Tour the framework", "image": Icons.explore},
    {"title": "Cookbook", "image": Icons.book},
    {"title": "Sample catalog", "image": Icons.storage},
    {"title": "Build layouts", "image": Icons.dashboard},
    {"title": "Add Interactivity", "image": Icons.touch_app},
    {"title": "Flutter for Web devs", "image": Icons.web},
    {"title": "Flutter for Android devs", "image": Icons.android},
    {"title": "Flutter for iOS devs", "image": Icons.tablet_mac},
    {"title": "Flutter for React Native devs", "image": Icons.apps},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('添加交互')),
      body: new Container(
        color: Colors.grey[200],
        child: new GridView.count(
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          crossAxisCount: 3,
          children: listItems.map((item) {
            int index = listItems.indexOf(item);
            Color displayColor = Colors.primaries[index % Colors.primaries.length];
            return new FlatButton(
              color: Colors.white,
              onPressed: () {
                print('点击了index: $index');
              },
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(item['image'], color: displayColor),
                  new Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    child: new Text(
                      item['title'],
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: displayColor
                      ),
                    ),
                  )
                ],
              )
            );
          }).toList()
        ),
      )
    );
  }
}