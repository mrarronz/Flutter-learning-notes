import 'package:flutter/material.dart';

class TourFramework extends StatelessWidget {

  final String title;

  TourFramework({Key key, this.title}) : super(key: key);

  final tourList = [
    "Hello world",
    "基础组件",
    "使用Material组件",
    "处理手势",
    "根据用户输入改变Widget",
    "整合所有"
  ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),),
      body: _buildListView()
    );
  }

  Widget _buildListView() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: _buildListTile,
      itemCount: tourList.length,
    );
  }

  Widget _buildListTile(BuildContext context, int position) {
    String title = tourList[position];
    return new ListTile(
      title: new Text(title),
      trailing: new Icon(Icons.chevron_right),
      onTap: () {
        switch (position) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
        }
      },
    );
  }
}