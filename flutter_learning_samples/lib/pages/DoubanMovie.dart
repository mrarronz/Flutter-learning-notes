import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/Service.dart';

class DoubanMovie extends StatefulWidget {

  @override
  createState() => new DoubanMovieState();
}


class DoubanMovieState extends State<DoubanMovie> {

  var _movieList;
  
  @override
  void initState() {
    _loadMovieData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('豆瓣电影'),),
      body: _buildContent()
    );
  }

  Widget _buildContent() {
    if (_movieList == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (context, i) => _renderRow(i)
      );
    }
  }

  Widget _renderRow(i) {
    var movieItem = _movieList[i];
    var title = movieItem["title"];
    var time = "上映时间：" + movieItem["year"];
    var actors = "主演：" + movieItem["actorNames"].toString();
    var directors = "导演：" + movieItem["directorNames"].toString();
    var score = movieItem["rating"]["average"];
    var scoreRow = new Row(
      children: <Widget>[
        new Expanded(child: new Text('暂无评分'))
      ],
    );;
    if (score > 0) {
      scoreRow = new Row(
        children: <Widget>[
          new Text('评分：'),
          new Text(score.toString(), style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.amber),)
        ],
      );

    }
    return new Column(
      children: <Widget>[
        new InkWell(
          child: new Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Image.network(
                  movieItem["images"]["large"],
                  width: 110.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(title, style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new Text(time),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: scoreRow
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new Text(directors),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new Text(actors),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          onTap: () {
            print('点击了电影：$title, index: $i');
          },
        ),
        new Divider(height: 1.0,)
      ],
    );
  }
  
  _loadMovieData() {
    Service.get('https://api.douban.com/v2/movie/in_theaters?city=北京&start=0&count=20').then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        var subjects = map["subjects"] as List;
        var tempList = new List();
        for (var i = 0; i < subjects.length; i++) {
          var movieItem = subjects[i];
          var movieDirectors = movieItem["directors"];
          var directors = "";
          for (var i = 0; i < movieDirectors.length; i++) {
            var director = movieDirectors[i];
            if (directors == "") {
              directors = directors + director["name"];
            } else {
              directors = directors + " " + director["name"];
            }
          }
          movieItem["directorNames"] = directors;

          var actors = "";
          var actorList = movieItem["casts"];
          for (var i = 0; i < actorList.length; i++) {
            var actor = actorList[i];
            if (actors == "") {
              actors = actors + actor["name"];
            } else {
              actors = actors + " " + actor["name"];
            }
          }
          movieItem["actorNames"] = actors;
          tempList.add(movieItem);
        }
        setState(() {
          _movieList = tempList;
        });
      }
    });
  }
}