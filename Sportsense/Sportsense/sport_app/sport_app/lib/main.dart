import 'package:flutter/material.dart';
import 'package:sport_app/layout/ip.dart';
import 'package:sport_app/layout/login.dart';
import 'package:sport_app/layout/mainpage.dart';
import 'package:sport_app/layout/matchdetails.dart';
import 'package:sport_app/layout/register.dart';
import 'package:sport_app/layout/user_profile.dart';
import 'package:sport_app/layout/view_facily.dart';
import 'package:sport_app/layout/view_match_det.dart';
import 'package:sport_app/layout/view_noti_news.dart';
import 'package:sport_app/layout/view_noti_score.dart';
import 'package:sport_app/layout/view_sports_det.dart';
import 'package:sport_app/layout/view_sports_nws.dart';
import 'package:sport_app/layout/loadurlnew.dart';
import 'package:sport_app/layout/weburl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    routes:{
      '/':(context)=>ip(),
      '/register':(context) => register(),
      '/user_profile':(context) => user_view_profile(),
      '/view_facility':(context) => view_facility(),
      '/view_match_det':(context) => view_match_det(),
      '/view_noti_news':(context) => view_noti_news(),
      '/view_noti_score':(context) => view_noti_score(),
      '/view_sports_det':(context) => view_sports_det(),
      '/view_sports_nws':(context) => view_sports_nws(),
      '/main_page':(context) => mainpage(),
      '/match':(context) => match(),
      '/views':(context) => weburl(),
      

    }
  ));
}