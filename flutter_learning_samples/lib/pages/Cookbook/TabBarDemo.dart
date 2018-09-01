import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Tab demo'),
          bottom: new TabBar(tabs: [
            new Tab(icon: new Icon(Icons.directions_bus)),
            new Tab(icon: new Icon(Icons.directions_car)),
            new Tab(icon: new Icon(Icons.directions_bike)),
          ]),
        ),
        body: TabBarView(children: [
          new Icon(Icons.directions_bus),
          new Icon(Icons.directions_car),
          new Icon(Icons.directions_bike),
        ]),
      )
    );
  }
}