import 'package:flutter/material.dart';

class OpacityAnimateDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new OpacityChanged();
  }
}

class OpacityChanged extends StatefulWidget {

  @override
  createState() => new OpacityDemoState();
}

class OpacityDemoState extends State<OpacityChanged> {

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Opacity Change Demo')),
      body: new Center(
        child: new AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: new Duration(milliseconds: 500),
          child: new Container(
            width: 200.0,
            height: 200.0,
            color: Colors.greenAccent,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: new Icon(Icons.flip),
      ),
    );
  }
}