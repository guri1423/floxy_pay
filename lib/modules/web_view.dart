
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class WebView extends StatelessWidget {
  final String selectedUrl = 'https://fxy.floxypay.io/';
  final FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

  void openFullscreenWebview() {
    flutterWebViewPlugin.launch(selectedUrl);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyWidget(openFullscreenWebview),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Function openFullscreenWebview;

  MyWidget(this.openFullscreenWebview);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    widget.openFullscreenWebview();
  }

  @override
  Widget build(BuildContext context) {
    return Center(

    );
  }
}
