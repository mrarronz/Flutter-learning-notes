import 'package:flutter/material.dart';

class OrientationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Orientation Demo')),
      body: new OrientationBuilder(
        builder: (context, orientation) {
          return new GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(100, (index) {
              return new Center(
                child: new Text('Item $index', style: Theme.of(context).textTheme.headline,),
              );
            }),
          );
        }
      ),
    );
  }
}