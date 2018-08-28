import 'package:flutter/material.dart';

class Counter extends StatefulWidget {


  @override
  State createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {

  int _counter = 0;
  int _newCounter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _newCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Counter'),),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new RaisedButton(
                onPressed: _increment,
                child: new Text('Increment'),
              ),
              new Text('Count: $_counter'),
            ],
          ),
          new Row(
            children: <Widget>[
              new CounterIncrementer(onPressed: _decrement),
              new CounterDisplay(count: _newCounter),
            ],
          ),
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {

  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementer extends StatelessWidget {

  CounterIncrementer({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Decrement'),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }
}