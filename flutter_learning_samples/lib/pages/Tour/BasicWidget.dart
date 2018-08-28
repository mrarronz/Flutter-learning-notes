import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Test Basic Widget',
              style: new TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(child:
            new Center(
              child: new Text('Hello World!!!',),
            )
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {

  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 64.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.red),
      child: new Container(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: new Row(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.chevron_left, color: Colors.white,), onPressed: () {
              Navigator.of(context).pop();
            }),
            new Expanded(child: title),
            new IconButton(icon: new Icon(Icons.search, color: Colors.white,), onPressed: null),
          ],
        ),
      ),
    );
  }
}