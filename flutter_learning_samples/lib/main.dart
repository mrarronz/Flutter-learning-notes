import 'package:flutter/material.dart';
import './pages/FirstDemo.dart';
import './pages/TourFramework.dart';
import './pages/Cookbook.dart';
import './pages/BuildLayout.dart';
import './pages/SampleCatalog.dart';

void main() => runApp(new HomeList());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: color
              ),
            ),
          )
        ],
      );
    }

    return new MaterialApp(
      title: title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.cyan[600],
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new GridView.count(
          crossAxisCount: 3,
          children: new List.generate(100, (index) {
            return new Center(
              child: buildButtonColumn(Icons.cake, "Item $index"),
            );
          }),
        ),
      ),
    );
  }
}

class HomeList extends StatelessWidget {

  final title = "Flutter official demo";
  final listItems = [
    {"title": "First demo", "image": Icons.looks_one},
    {"title": "Tour the framework", "image": Icons.explore},
    {"title": "Cookbook", "image": Icons.book},
    {"title": "Sample catalog", "image": Icons.storage},
    {"title": "Build layouts", "image": Icons.dashboard},
    {"title": "Add Interactivity", "image": Icons.touch_app},
    {"title": "Flutter for Web devs", "image": Icons.web},
    {"title": "Flutter for Android devs", "image": Icons.android},
    {"title": "Flutter for iOS devs", "image": Icons.tablet_mac},
    {"title": "Flutter for React Native devs", "image": Icons.apps},
  ];
  final _textFont = const TextStyle(fontSize: 17.0, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: _buildRow,
      itemCount: listItems.length,
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    final mapItem = listItems.elementAt(index);
    return new ListTile(
      leading: new Icon(mapItem["image"]),
      title: new Text(mapItem["title"], style: _textFont,),
      trailing: new Icon(Icons.chevron_right),
      onTap: () {
        String title = mapItem["title"];
        switch (index) {
          case 0:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new FirstDemo(title: title)));
            break;
          case 1:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new TourFramework(title: title)));
            break;
          case 2:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new Cookbook(title: title)));
            break;
          case 3:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new SampleCatalog(title: title)));
            break;
          case 4:
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new BuildLayout(title: title)));
            break;
        }
      },
    );
  }
}

