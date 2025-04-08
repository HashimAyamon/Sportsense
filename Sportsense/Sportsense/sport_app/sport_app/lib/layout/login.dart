import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:sport_app/layout/draw.dart';
import 'package:sport_app/layout/mainpage.dart';
import 'package:sport_app/layout/option.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
  static var url="http://192.168.20.3:8000/";
  static var  uid="1";
}

class _loginState extends State<login> {
  bool _passwordVisible = true;
  late TextEditingController username,password;
  var data=[];

  @override
  void initState() {
    username=TextEditingController();
    password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    var url= login.url+"login/ login_flut/";
    Response resp = await post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    data=jsonDecode(resp.body);
    if (data.length>0)
    {
      login.uid=data[0]['u_id'].toString();
      if(data[0]['type']=="user")
      {
        // Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>mainpage()
        ));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("you have successfully logged in")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 800,
              // width: 600,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 26, 48),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                  ),
                  new Image.asset('assets/e.gif',width: 200,height: 200,),
                  Container(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,10,200,20),
                    child: Text("Login",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSams',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 150, 10),
                    child: Text("Please Sign in to continue",style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'OpenSams',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: TextFormField(
                        controller: username,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                            prefixIcon: Icon(Icons.mail,color: Colors.blueGrey,),
                            fillColor: Colors.white10,
                            // filled: true,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                            )
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextFormField(
                        controller: password,
                        style: TextStyle(color: Colors.white),
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelStyle: TextStyle(color: Colors.blueGrey),
                            prefixIcon: Icon(Icons.lock_person,color: Colors.blueGrey,),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                            )
                        ),
                      )),
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
                        postdata();
                      },
                      child: Text("LOGIN",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                                text: 'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 12,
                                ),
                                recognizer: TapGestureRecognizer()..onTap=(){

                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>login()));
                                }
                            )
                          ]
                      )),
                  Container(
                    height: 50,
                  ),
                  RichText(text: TextSpan(
                      text: 'Do not have an account..?  ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()..onTap=(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>option()));
                            }
                        )
                      ]
                  ))
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}