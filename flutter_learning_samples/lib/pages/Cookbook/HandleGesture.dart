import 'package:flutter/material.dart';

class HandleGesture extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Handle Gesture')),
      body: _buildDismissibleListView()
    );
  }

  /// 手势滑动删除的ListView
  Widget _buildDismissibleListView() {
    final items = new List<String>.generate(100, (i) => "item ${i+1}");
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return new Dismissible(
          background: new Container(color: Colors.red,),
          key: new Key(item),
          child: new ListTile(title: new Text(item)),
          onDismissed: (direction) {
            items.removeAt(index);
            Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item dismissed!')));
          },
        );
      }
    );
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text('Hey, you tapped the button just now'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: const EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: new BorderRadius.circular(8.0)
        ),
        child: new Text('My Button'),
      ),
    );
  }
}

/// 触摸水波效果的button
class InkWellButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Tap InkWell')));
      },
      child: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Text('Flat Button'),
      ),
    );
  }
}