import 'package:flutter/material.dart';
import './Cookbook/ThemeUsage.dart';
import './Cookbook/ImageUsage.dart';
import './Cookbook/ListUsage.dart';
import './Cookbook/HandleGesture.dart';
import './Cookbook/NavigateScreen.dart';
import './Cookbook/SnackBar.dart';
import './Cookbook/TabBarDemo.dart';
import './Cookbook/CustomFont.dart';
import './Cookbook/DrawerDemo.dart';
import './Cookbook/OrientationWidget.dart';
import './Cookbook/OpacityAnimateDemo.dart';
import './Cookbook/HttpDemo.dart';

class Cookbook extends StatelessWidget {

  final String title;

  Cookbook({Key key, this.title}) : super(key: key);

  final cookbooks = [
    "使用主题共享颜色和字体样式",
    "SnackBar",
    "Working with Tabs",
    "Custom Font",
    "Add a drawer",
    "Update UI based on Orientation",
    "加载图片",
    "列表的基本使用",
    "处理手势",
    "简单动画",
    "导航",
    "网络请求",
    "WebSocket",
    "JSON转换",
    "使用SharedPreferences进行键值对存储",
    "文件读写",
    "表单使用",
    "Unit Testing",
    "Widget Testing",
    "Integration Testing"
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
            /// 主题theme简单使用
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ThemeUsage(title: title)));
            break;
          case 1:
            /// SnackBar
            Navigator.push(context, new MaterialPageRoute(builder: (ctx) => new SnackBarDemo()));
            break;
          case 2:
            /// Tabs
            Navigator.push(context, new MaterialPageRoute(builder: (ctx) => new TabBarDemo()));
            break;
          case 3:
            /// Custom Fonts
            Navigator.push(context, new MaterialPageRoute(builder: (ctx) => new CustomFont()));
            break;
          case 4:
            Navigator.push(context, new MaterialPageRoute(builder: (ctx) => new DrawerDemo()));
            break;
          case 5:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new OrientationWidget()));
            break;
          case 6:
            /// 加载图片
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ImageUsage()));
            break;
          case 7:
            /// 列表的用法
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ListUsage()));
            break;
          case 8:
            /// 处理手势
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new HandleGesture()));
            break;
          case 9:
          /// 简单动画
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new OpacityAnimateDemo()));
            break;
          case 10:
            /// 基本导航
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new NavigateScreen()));
            break;
          case 11:
            /// 网络请求
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new HttpDemo()));
            break;
        }
      },
    );
  }
}