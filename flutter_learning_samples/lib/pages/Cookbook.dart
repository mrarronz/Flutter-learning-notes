import 'package:flutter/material.dart';
import './Cookbook/ThemeUsage.dart';
import './Cookbook/ImageUsage.dart';
import './Cookbook/ListUsage.dart';

class Cookbook extends StatelessWidget {

  final String title;

  Cookbook({Key key, this.title}) : super(key: key);

  final cookbooks = [
    "使用主题共享颜色和字体样式",
    "加载图片",
    "列表的基本使用"
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
      itemBuilder: _buildListTile,
      itemCount: cookbooks.length,
      padding: const EdgeInsets.all(8.0),
    );
  }

  Widget _buildListTile(BuildContext context, int position) {
    String title = cookbooks[position];
    return new ListTile(
      title: new Text(title),
      trailing: new Icon(Icons.chevron_right),
      onTap: () {
        switch (position) {
          case 0:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ThemeUsage(title: title)));
            break;
          case 1:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ImageUsage()));
            break;
          case 2:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ListUsage()));
            break;
        }
      },
    );
  }
}