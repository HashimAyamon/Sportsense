import 'package:flutter/material.dart';
import 'package:sport_app/layout/login.dart';
class draw extends StatefulWidget {
  const draw({Key? key}) : super(key: key);

  @override
  State<draw> createState() => _drawState();
}
class _drawState extends State<draw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/ii.png'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome User',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 26, 48),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/user_profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Facility'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_facility');
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Match Details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_match_det');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.newspaper),
            //   title: Text('Notification News'),
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/view_noti_news');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.score),
              title: Text('Notification Score'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_noti_score');
              },
            ),
             ListTile(
              leading: Icon(Icons.description_outlined),
              title: Text('Live Sports Details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/views');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Sports Details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_sports_det');
              },
            ),
           
            ListTile(
              leading: Icon(Icons.newspaper_sharp),
              title: Text('Sports News'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_sports_nws');
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
