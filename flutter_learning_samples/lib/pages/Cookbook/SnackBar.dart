import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('SnackBar usage')),
      body: new SnackBarPackage()
    );
  }
}

/// 这里SnackBarPackage必须单独作为一个StatelessWidget分离出来
class SnackBarPackage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: new Text('Show SnackBar'),
        onPressed: () {
          final snackBar = new SnackBar(
            content: new Text('This is a SnackBar'),
            action: SnackBarAction(label: 'Undo', onPressed: () {}), // onPressed不能为null
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}