import 'package:flutter/material.dart';

class NavigateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('测试页面跳转回传值')),
      body: new Center(
        child: new SelectionButton(),
      )
    );
  }
}

/// 创建点击的button
class SelectionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('点击跳转到下个页面'),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      }
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.of(context).push(
        new MaterialPageRoute(builder: (ctx) => new SelectionScreen()));
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$result')));
  }
}

/// 创建页面
class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('选择值')),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "Hello");
                },
                child: new Text('Hello!'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "How are you");
                },
                child: new Text('How are you!'),
              ),
            ),
          ],
        ),
      )
    );
  }
}