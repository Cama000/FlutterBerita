import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(new ArticlePage(null));

class ArticlePage extends StatelessWidget {
  static String tag = 'Article';
  ArticlePage(this.urln);
  final String urln;
  Widget build(BuildContext context) {
    return new Scaffold(
            body: new SafeArea(
              child: new WebviewScaffold(
              url: "$urln",
              appBar: Appbar(
                height: 55,
              ),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Memuat...'),
              ),
          ),
        ),
            ),
    );
  }
}

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const Appbar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0xFF325384).withOpacity(0.8),
                    title: Text('Flutteruas'),
                    floating: true,
                    pinned: true,
                    centerTitle: true,
                  )
                ],
              );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
