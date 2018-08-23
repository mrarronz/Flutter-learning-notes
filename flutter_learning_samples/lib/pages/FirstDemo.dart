import 'package:flutter/material.dart';

class FirstDemo extends StatelessWidget {

  final String title;

  FirstDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text('这是第一个demo'),
      ),
    );
  }
}