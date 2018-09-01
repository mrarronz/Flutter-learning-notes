import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageUsage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Image Usage')),
      body: _loadImageWithGesture(context)
    );
  }

  /// 加载网络图片
  Widget _buildNetworkImage() {
    return new Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536126831&di=c5893a5e26317047cc4de028ee64b42c&imgtype=jpg&er=1&src=http%3A%2F%2Fpic34.photophoto.cn%2F20150112%2F0034034439579927_b.jpg'
    );
  }

  /// 淡入显示图片
  Widget _buildFadeInImage() {
    return new FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg'
    );
  }

  /// 使用Stack组件加载图片，显示CircularProgressIndicator
  Widget _loadImageWithProgress() {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new CircularProgressIndicator(),
        ),
        new Center(
          child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg'
          ),
        )
      ],
    );
  }

  /// 加载缓存图片
  Widget _loadCachedImage() {
    return new Center(
      child: new CachedNetworkImage(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg',
        placeholder: new CircularProgressIndicator(),
      ),
    );
  }

  /// 给图片加上点击事件，点击图片后跳转到新页面显示图片
  Widget _loadImageWithGesture(BuildContext context) {
    return new GestureDetector(
      child: new Hero(
        tag: "imageHero",
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg')
      ),
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (ctx) => new DetailScreen()));
      },
    );
  }

}

/// 图片详情展示页面
class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GestureDetector(
        child: new Center(
          child: new Hero(
            tag: "imageHero",
            child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535532153762&di=d24d75c5772c9463f89a4631298f1ec7&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201706%2F09%2Feb84aab0b8ad42cd4b6cc9bbf70ec5a7.jpg')
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}