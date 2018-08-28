import 'package:flutter/material.dart';
import './Tour/BasicWidget.dart';
import './Tour/MaterialWidget.dart';
import './Tour/FlutterGesture.dart';
import './Tour/Counter.dart';
import './Tour/ShoppingList.dart';

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
            showDialog(
              context: context,
              builder: (ctx) => new AlertDialog(
                title: new Text('Tip'),
                content: new Text('Hello Flutter!!!'),
                actions: <Widget>[
                  new FlatButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: new Text('确定'))
                ],
              )
            );
            break;
          case 1:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new BasicWidget()));
            break;
          case 2:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new MaterialWidget()));
            break;
          case 3:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new FlutterGesture()));
            break;
          case 4:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new Counter()));
            break;
          case 5:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new ShoppingList(products: <Product>[
              new Product(name: 'Eggs'),
              new Product(name: 'Flour'),
              new Product(name: 'Chocolate chips'),
              new Product(name: 'icecream'),
              new Product(name: 'cocacola')
            ])));
            break;
        }
      },
    );
  }
}