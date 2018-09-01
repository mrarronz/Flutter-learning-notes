import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/foundation.dart';

class WebSocketDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new SocketUsage();
  }
}

class SocketUsage extends StatefulWidget {

  final WebSocketChannel channel;

  SocketUsage({Key key, this.channel}) : super(key : key);

  @override
  createState() => new SocketState();
}

class SocketState extends State<SocketUsage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Socket Demo')),
      body: new Center(
        child: new Text('Socket Demo'),
      ),
    );
  }
}