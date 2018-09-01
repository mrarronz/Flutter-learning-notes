import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Custom Font Usage')),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text('测试字体-系统字体'),
            new Text('测试字体-华文仿宋', style: new TextStyle(fontFamily: 'CustomFont')),
          ],
        )
      ),
    );
  }
}