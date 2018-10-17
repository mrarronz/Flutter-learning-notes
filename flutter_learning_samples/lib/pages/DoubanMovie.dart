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
    var title = _movieList[i]["title"];
    return new Text(title);
  }
  
  _loadMovieData() {
    Service.get('https://api.douban.com/v2/movie/in_theaters?city=北京&start=0&count=20').then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        var subjects = map["subjects"] as List;
        var tempList = new List();
        for (var i = 0; i < subjects.length; i++) {
          var movieItem = subjects[i];
//          var movieDirectors = movieItem["directors"] as List;
//          var directors = "";
//          for (var i = 0; i < movieDirectors.length; i++) {
//            var director = movieDirectors[i];
//            if (directors == "") {
//              directors = directors + director["name"];
//            } else {
//              directors = directors + " " + director["name"];
//            }
//          }
//          movieItem["directorNames"] = directors;
//
//          var actors = "";
//          var actorList = movieItem["casts"] as List;
//          for (var i = 0; i < actorList.length; i++) {
//            var actor = actorList[i];
//            if (actors == "") {
//              actors = actors + actor["name"];
//            } else {
//              actors = actors + " " + actor["name"];
//            }
//          }
//          movieItem["actorNames"] = actors;
          tempList.add(movieItem);
        }
        setState(() {
          _movieList = tempList;
        });
      }
    });
  }
}

class Movie {
  final String title;
  final String year;
  final String averageScore;
  final String thumbnail;

  Movie({this.title, this.year, this.averageScore, this.thumbnail});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
      title: json["title"] as String,
      year: json["year"] as String,
      averageScore: json["rating"]["average"] as String,
      thumbnail: json["images"]["large"] as String
    );
  }
}