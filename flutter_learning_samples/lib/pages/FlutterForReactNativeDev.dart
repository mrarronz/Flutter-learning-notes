import 'package:flutter/material.dart';

class FlutterForReactNativeDev extends StatelessWidget {

  final listItems = [
    "介绍Dart for JavaScript 开发者",
    "基础",
    "项目结构和资源",
    "Flutter widgets",
    "Views",
    "布局",
    "样式",
    "状态管理",
    "Props",
    "本地存储",
    "路由",
    "手势检测和触摸事件处理",
    "发出HTTP网络请求",
    "表单输入",
    "特定于平台的代码",
    "调试",
    "动画",
    "React Native和Flutter Widget等效组件"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter For ReactNative Dev')),
      body: new Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10.0),
        child: new GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: listItems.map((item){
            int index = listItems.indexOf(item);
            return new GestureDetector(
              child: new Card(
                color: Colors.primaries[index % Colors.primaries.length],
                child: new Center(
                  child: new Text(item, style: new TextStyle(fontSize: 16.0, color: Colors.white), textAlign: TextAlign.center,),
                ),
              ),
              onTap: () {
                print('Clicked item at index $index');
              },
            );
          }).toList(),
        ),
      )
    );
  }
}