import 'package:flutter/material.dart';
import 'WebDev/WebLayoutBasic.dart';

class FlutterForWebDev extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter For Web Dev')),
      body: new ListView.builder(
        itemCount: webItems.length,
        itemBuilder: (BuildContext context, int index) {
          return new EntryItem(webItems[index]);
        }
      )
    );
  }
}

class EntryItem extends StatelessWidget {

  const EntryItem(this.entry);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return _buildTile(entry);
  }

  Widget _buildTile(Entry entry) {
    if (entry.children.isEmpty) {
      return new ListTile(
        title: new Text(entry.title),
        onTap: () {

        },
      );
    }
    return new ExpansionTile(
      title: new Text(entry.title),
      key: new PageStorageKey<Entry>(entry),
      children: entry.children.map(_buildTile).toList(),
    );
  }

//  _onTapListItem(String title) {
//    switch (title) {
//      case '给文本添加样式':
//        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new WebLayoutBasic()));
//        break;
//      case '设置背景颜色':
//        break;
//      case '居中组件':
//        break;
//      case '设置容器宽度':
//        break;
//    }
//  }
}

class Entry {

  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> webItems = <Entry> [
  new Entry(
    "执行布局操作",
    <Entry>[
      new Entry("给文本添加样式"),
      new Entry("设置背景颜色"),
      new Entry("居中组件"),
      new Entry("设置容器宽度")
    ]
  ),
  new Entry(
    "控制位置和大小",
    <Entry>[
      new Entry("设置绝对位置"),
      new Entry("旋转组件"),
      new Entry("缩放组件"),
      new Entry(
        "应用线性渐变",
        <Entry>[
          new Entry("垂直渐变"),
          new Entry("水平渐变"),
        ]
      ),
    ]
  ),
  new Entry(
    "处理形状",
    <Entry>[
      new Entry("圆角"),
      new Entry("添加阴影"),
      new Entry("圆和椭圆")
    ]
  ),
  new Entry(
    "操作文本",
    <Entry>[
      new Entry("调整文本间距"),
      new Entry("转换文本"),
      new Entry("进行内联格式更改"),
      new Entry("创建文本摘要")
    ]
  ),
];