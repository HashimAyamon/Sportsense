import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sport_app/layout/login.dart';

import 'bottomnav.dart';
import 'draw.dart';
class view_noti_score extends StatefulWidget {
  const view_noti_score({Key? key}) : super(key: key);

  @override
  State<view_noti_score> createState() => _view_noti_scoreState();
}

class _view_noti_scoreState extends State<view_noti_score> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"notification_score/user/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      drawer: draw(),
      bottomNavigationBar: botnav(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "SPORTSENSE",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/local.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here
                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              new Text("Date : "+" "+data[index]['date'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text("Time : "+" "+data[index]['time'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text('Team Name : '+" "+data[index]['team_name'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new SizedBox(height: 6.0),

                              new Text('Score : ' +" "+data[index]['score'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );

  }
}