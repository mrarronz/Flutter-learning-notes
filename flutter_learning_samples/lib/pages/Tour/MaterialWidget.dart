import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.chevron_left),
          tooltip: 'back',
          onPressed: () {
            Navigator.of(context).pop();
        }),
        title: new Text('Material Widget Example'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white,),
            tooltip: 'search',
            onPressed: null
          ),
        ],
      ),
      body: new Center(
        child: new Text('This is Material Widget Example.'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null
      ),
    );
  }
}