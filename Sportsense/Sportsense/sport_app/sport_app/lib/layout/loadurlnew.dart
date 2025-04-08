import 'package:flutter/material.dart';
import 'package:sport_app/layout/login.dart';
import 'package:url_launcher/url_launcher.dart';

class loadurlnew extends StatefulWidget {
  const loadurlnew({Key? key}) : super(key: key);

  @override
  State<loadurlnew> createState() => _loadurlnewState();
}

// @override



class _loadurlnewState extends State<loadurlnew> {

  @override
  void  initState() async{
    // TODO: implement initState
    super.initState();
    String url = login.url+'sports_news/news/';
    // Check if the URL can be launched, then open it in the default browser.
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WebView Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              String url = login.url+'sports_news/news/';
              // Check if the URL can be launched, then open it in the default browser.
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text('News'),
          ),
        ),
      ),
    );
  }
}

