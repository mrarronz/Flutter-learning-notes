import 'package:flutter/material.dart';

class SampleCatalog extends StatelessWidget {

  final String title;

  SampleCatalog({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Center(
        child: new Text('Sample catalog'),
      ),
    );
  }
}