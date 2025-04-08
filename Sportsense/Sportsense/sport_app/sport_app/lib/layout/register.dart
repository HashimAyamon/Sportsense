import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sport_app/layout/login.dart';
import 'package:file_picker/file_picker.dart';
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
  var fil,objfile;
  bool validatephone(String value){
    var ph=value;
    bool phone=RegExp(r'(^(?:|[+0]9)?[0-9]{10,12}$)').hasMatch(ph);
    return phone;
  }
  late TextEditingController name,email,phone,password,image;
  bool _passwordVisible = true;
  @override
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    image=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url=login.url+"user/user_post_register/";
    if (name.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Required User Name")));
    }
  
    else if (email.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Required Email")));
    }
    else if (!validatephone(phone.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Phone Number")));
    }
    else if (password.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Required Password")));
    }
    else if (image.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Required image")));
    }
    else {
      var resp = await post(url, body: {
        "username": name.text.toString(),
        "email": email.text.toString(),
        "phone": phone.text.toString(),
        "password": password.text.toString(),
        "image":image.text.toString(),
      });




      final request = MultipartRequest(
          "POST", Uri.parse(login.url + 'user/wokrupload/'));
      request.fields["id"] = "bus";
      request.files.add(MultipartFile(
          "file", objfile.readStream, objfile.size, filename: objfile.name));
      var resp1 = await request.send();
      final respStr = await resp1.stream.bytesToString();
    }
  }
  file_up() async {
    print('added successfully');
    var result = await FilePicker.platform.pickFiles(withReadStream: true);
    if (result != null) {
      // var fil=result.files.single.path;
      setState(() {
        fil = result.files.first.name;
        objfile = result.files.single;
        image.text = fil;
      });
    }
    else { // User canceled the picker
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text(
      //     "Add Students Info",
      //     style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 32, 26, 48),
              Color.fromARGB(255, 32, 26, 48),
              // Colors.grey
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 40,
              ),
              Container(

                padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
                child: Text("User Register",style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSams',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: name,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(Icons.person,color: Colors.blueGrey,),
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
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(Icons.email,color: Colors.blueGrey,),
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
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(Icons.phone_android,color: Colors.blueGrey,),
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
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: password,
                    style: TextStyle(color: Colors.white),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
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
                padding: EdgeInsets.symmetric(vertical: 1.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    file_up();
                  },
                  padding: EdgeInsets.all(15.15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    //borderRadius: BorderRadius.only()
                  ),
                  color: Colors.white,
                  child: Text(
                    'pick image',
                    style: TextStyle(
                      color: Color(0xFF072850),
                      letterSpacing: 1.5,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => register()));
                  },
                  child: Text("SIGN UP",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                ),
              ),

            ]),
          ),
        ),
      ),
    );
  }
}