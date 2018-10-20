import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/Service.dart';
import 'dart:async';

class DoubanMovie extends StatefulWidget {

  @override
  createState() => new DoubanMovieState();
}


class DoubanMovieState extends State<DoubanMovie> {

  var _movieList;
  var _startPage = 1;
  var _pageSize = 10;
  var _totalCount = 0;
  ScrollController _controller = new ScrollController();

  DoubanMovieState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && _movieList.length < _totalCount) {
        // scroll to bottom, get next page data
        print("load more ... ");
        _loadMovieData();
      }
    });
  }
  
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
      return new RefreshIndicator(
        child: new ListView.builder(
          itemCount: _movieList.length,
          itemBuilder: (context, i) => _renderRow(i),
          controller: _controller,
        ),
        onRefresh: _pullToRefresh
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
            color: Color(0xFFF5FCFF),
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

  Future<Null> _pullToRefresh() async {
    _loadMovieData();
    return null;
  }
  
  _loadMovieData() {
    var params = {"city": "北京", "start": _startPage.toString(), "count": _pageSize.toString()};
    Service.get('https://api.douban.com/v2/movie/in_theaters', params: params).then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        var totalNum = map["total"];
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
        var page = _startPage;
        var tempArr = _movieList;
        if (tempArr == null) {
          tempArr = [];
        }
        var currentData = new List();
        if (page == 1) {
          currentData = tempList;
        } else {
          currentData.addAll(_movieList);
          currentData.addAll(tempList);
        }
        if (tempArr.length + tempList.length < totalNum) {
          page += tempList.length;
          // 还可以加载更多数据，page为下一次加载从第几条开始
        }
        setState(() {
          _movieList = currentData;
          _startPage = page;
          _totalCount = totalNum;
        });
      }
    });
  }
}