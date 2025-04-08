import 'package:flutter/material.dart';
class botnav extends StatefulWidget {
  const botnav({Key? key}) : super(key: key);

  @override
  State<botnav> createState() => _botnavState();
}

class _botnavState extends State<botnav> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          // if(_currentIndex==0)
          //   {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, '/main_page');
          //   }
            if(_currentIndex==0)
            {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/user_profile');
            }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_match_det');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/views');
          }
          // else if(_currentIndex==3)
          // {
          //   Navigator.pop(context);
          //   Navigator.pushNamed(context, '/views');
          // }
          // else if(_currentIndex==4)
          // {
          //   Navigator.pop(context);
          //   Navigator.pushNamed(context, '/view_sports_det');
          // }
        });

      },
      items: [
        // BottomNavigationBarItem(
        //   label: '',

        //   icon: Icon(Icons),
        // ),
        BottomNavigationBarItem(
          label: 'Profile',

          icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: 'Match details',
          icon: Icon(Icons.description),
        ),
        BottomNavigationBarItem(
          label: 'Live Sports details',
          icon: Icon(Icons.description_outlined),
        ),
        // BottomNavigationBarItem(
        //   label: 'Sports Details',
        //   icon: Icon(Icons.note),
        // ),
      ],
    );;
  }
}
