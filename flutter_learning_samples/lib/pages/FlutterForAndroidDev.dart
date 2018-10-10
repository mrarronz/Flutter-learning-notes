import 'package:flutter/material.dart';

class FlutterForAndroidDev extends StatelessWidget {

  final listItems = [
    "Views",
    "Intents",
    "异步UI",
    "项目结构和资源",
    "Activities 和 Fragments",
    "Layouts",
    "手势检测和触摸事件处理",
    "Listview & Adapter",
    "使用 Text",
    "表单输入",
    "Flutter 插件",
    "主题",
    "数据库和本地存储",
    "通知"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter For Android Dev')),
      body: new Container(
        color: Colors.grey[100],
        child: new GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 10.0,
          children: listItems.map((item) {
            int index = listItems.indexOf(item);
            Color displayColor = Colors.primaries[index % Colors.primaries.length];
            return new Container(
              child: new FlatButton(
                onPressed: () {
                  print('you have pressed index $index');
                },
                child: new Text(item, textAlign: TextAlign.center, style: new TextStyle(fontSize: 16.0, color: Colors.white),),
              ),
              decoration: new BoxDecoration(
                color: displayColor,
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
            );
          }).toList(),
        ),
        padding: const EdgeInsets.all(10.0),
      )
    );
  }
}