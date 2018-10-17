import 'package:flutter/material.dart';
import 'DoubanMovie.dart';

class FlutterForIOSDev extends StatelessWidget {

  final items = [
    'Views',
    '导航',
    "线程和异步",
    "工程结构、本地化、依赖和资源",
    "ViewControllers",
    "布局",
    "手势检测及触摸事件处理",
    "主题和文字",
    "表单输入",
    "和硬件、第三方服务以及平台交互",
    "数据库和本地存储",
    "通知",
    "豆瓣电影"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter For iOS Dev')),
      body: new Container(
        color: Colors.grey[100],
        child: new GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: items.map((item){
            int index = items.indexOf(item);
            Color displayColor = Colors.primaries[index % Colors.primaries.length];
            return new Container(
              child: new FlatButton(
                onPressed: () {
                  print('点击了index: $index');
                  _onTapEvent(context, index);
                },
                child: new Text(item, style: new TextStyle(fontSize: 12.0, color: Colors.white), textAlign: TextAlign.center,),
              ),
              decoration: new BoxDecoration(
                color: displayColor,
                borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
              ),
            );
          }).toList(),
        ),
        padding: const EdgeInsets.all(10.0),
      )
    );
  }

  _onTapEvent(BuildContext context, int index) {
    switch (index) {
      case 12:
        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new DoubanMovie()));
        break;
    }
  }
}
