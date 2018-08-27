import 'package:flutter/material.dart';

class Cookbook extends StatelessWidget {

  final String title;

  Cookbook({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),),
      body: new Center(
        child: new Text('Cookbook'),
      ),
    );
  }
}