// import 'package:career_guidence/layout/login.dart';

import 'package:flutter/material.dart';
import 'package:sport_app/layout/login.dart';

// import 'loadurl.dart';


// import 'package:l/layout/webview.dart';

class ip extends StatefulWidget {
  const ip({Key? key}) : super(key: key);
  static var url="";
  @override
  State<ip> createState() => _ipState();
}

class _ipState extends State<ip> {
  late TextEditingController ipc;
  @override
  void initState() {


    ipc = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IP CONFIG",
          style: new TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.cyan),
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    "IP Config",
                    style: new TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 20, 90, 0),
                  child: TextFormField(
                    controller: ipc,
                    decoration: InputDecoration(
                        labelText: "Ip Address",
                        hintText: "enter your ip address",
                        prefixIcon: Icon(Icons.phone_iphone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      //login.url="http://192.168.99.146:8000/";
                      login.url="http://"+ipc.text+":8000/";
                      // mainpage.url="http://"+ipc.text+":8000/";
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => login()));
                    },
                    child: Text("Go"),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}