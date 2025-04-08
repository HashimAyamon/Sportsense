import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'login.dart';

class weburl extends StatefulWidget {
  const weburl({Key? key}) : super(key: key);

  @override
  State<weburl> createState() => _weburlState();
}

class _weburlState extends State<weburl> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: login.url+'sports_news/news/');
    
  }
}