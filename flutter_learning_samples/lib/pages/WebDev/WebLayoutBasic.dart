import 'package:flutter/material.dart';

class WebLayoutBasic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('执行布局操作'),),
      body: new Container(
        child: new Center(
          child: new Text(
            '布局操作基本知识',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.blueAccent
            ),
          ),
        ),
        width: 320.0,
        height: 480.0,
        color: Colors.yellow[100],
      ),
    );
  }
}