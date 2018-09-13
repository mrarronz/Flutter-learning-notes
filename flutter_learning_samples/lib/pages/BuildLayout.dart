import 'package:flutter/material.dart';

class BuildLayout extends StatelessWidget {

  final String title;

  BuildLayout({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text(title),),
      body: new ListView(
        children: <Widget>[
          _buildImageHeader(),
          _buildTitleSection(),
          _buildButtonSection(),
          _buildTextSection()
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return new Image.network(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg',
      height: 240.0,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitleSection() {
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text('This is the place name', style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
                new Text('This is the subtitle', style: new TextStyle(color: Colors.grey))
              ],
            )
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
  }

  Widget _buildButtonSection() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton(
          onPressed: () {
            print('点击了CallButton');
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.call, color: Colors.blue),
                padding: const EdgeInsets.only(bottom: 8.0),
              ),
              new Text('CALL', style: new TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        new FlatButton(
          onPressed: () {
            print('点击了RouteButton');
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.near_me, color: Colors.blue),
                padding: const EdgeInsets.only(bottom: 8.0),
              ),
              new Text('ROUTE', style: new TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        new FlatButton(
          onPressed: () {
            print('点击了ShareButton');
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.share, color: Colors.blue),
                padding: const EdgeInsets.only(bottom: 8.0),
              ),
              new Text('SHARE', style: new TextStyle(color: Colors.blue)),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTextSection() {
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('Thisdasdasssssssskkkkkkkkkkkkkkkkkkdddddddddddddddhhhhhhhhhhhhhhheeeeeeeeeeeeeoooooooooooooopppppppppppppppkkkkkkkkkkkkkkkkkkkkk', style: new TextStyle(color: Colors.black54, fontSize: 15.0)),
    );
  }
}