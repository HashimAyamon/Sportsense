import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sport_app/layout/login.dart';
import 'package:sport_app/layout/matchdetails.dart';
import 'bottomnav.dart';
import 'draw.dart';
class view_match_det extends StatefulWidget {
  const view_match_det({Key? key}) : super(key: key);
  @override
  State<view_match_det> createState() => _view_match_detState();
}
class _view_match_detState extends State<view_match_det> {
  late List data;
  late List outputList;
  var len=0;
  late TextEditingController filt;
  void List_function() async {
    var url = Uri.parse(login.url+"local_match_details/user_view_localmatch/");
    Response resp1 = await get(url);
    this.setState(() {
      data = jsonDecode(resp1.body);
      outputList=data;
      len=outputList.length;
      print(len);
    });
  }
  @override
  void initState(){
    List_function();
    filt=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
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
        //  decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/new.jpg'),
        //       fit: BoxFit.cover,
        //     )
        // ),
        child:SingleChildScrollView(
            child:
            Column(

              children: [
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.search)),
                  controller: filt,
                  onChanged: (data1){
                    if (data1!="")
                    {
                      setState(() {
                        outputList = data.where((o) => o['location'].contains(data1)).toList();
                        // outputList = data.where((o) => o['loc/ation']==data1).toList();
                      });
                    }
                    else
                    {
                      setState(() {
                        outputList=data;
                      });
                    }

                    // print(data);
                  },
                ),
                new ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: outputList == null ? 0 : outputList.length,
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
                                    // new Text("Date"+" "+data[index]['date'].toString(), style: Theme
                                    //     .of(context)
                                    //     .textTheme
                                    //     .titleMedium,
                                    // ),
                                    // new SizedBox(height: 6.0),
                                    //
                                    // new Text("Time"+" "+data[index]['time'].toString(), style: Theme
                                    //     .of(context)
                                    //     .textTheme
                                    //     .titleMedium,
                                    // ),
                                    // new SizedBox(height: 6.0),

                                    new Text('Sports Item : ' +" "+outputList[index]['sports_item'].toString(), style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                    ),
                                    new SizedBox(height: 6.0),

                                    new Text('Team Name : '+" "+outputList[index]['team_name'].toString(), style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                    ),
                                    new SizedBox(height: 6.0),

                                    new Text('Score : '+" "+data[index]['score'].toString(), style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                    ),
                                    new SizedBox(height: 6.0),

                                    new Text('Location : '+" "+outputList[index]['location'].toString(), style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                    ),
                                    new SizedBox(height: 6.0),

                                    // new Text('Status:' +" "+data[index]['status'].toString(), style: Theme
                                    //     .of(context)
                                    //     .textTheme
                                    //     .titleMedium
                                    // ),
                                    Container(
                                      width: 150,
                                      height: 60,
                                      padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.tealAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: (){
                                          match.did=data[index]['match_id'].toString();
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) => match()));
                                        },
                                        child: Text("DETAILS",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                      ),
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
                ),
              ],
            )
        ),
      ),
    );
  }
}