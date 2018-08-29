import 'package:flutter/material.dart';

class ThemeUsage extends StatelessWidget {

  ThemeUsage({Key key, this.title}): super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: new FloatingActionButton(onPressed: null, child: new Icon(Icons.add))
      ),
    );
  }
}