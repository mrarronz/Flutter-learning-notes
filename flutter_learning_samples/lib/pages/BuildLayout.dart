import 'package:flutter/material.dart';

class BuildLayout extends StatelessWidget {

  final String title;

  BuildLayout({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text(title),),
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}