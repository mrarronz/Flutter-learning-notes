import 'package:flutter/material.dart';

class FlutterGesture extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gesture'),
      ),
      body: new GestureDetector(
        onTap: () {
          print('Button is tapped!!');
        },
        child: new Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.lightGreen[500],
          ),
          child: new Center(
            child: new Text('Engage'),
          ),
        ),
      ),
    );
  }
}