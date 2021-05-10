import 'package:flutter/material.dart';
import 'package:music_app/pages/home/home.dart';
import 'package:music_app/pages/home/song_detail.dart';
import 'package:music_app/pages/person/personal.dart';

///
final homeNestedKey = GlobalKey<NavigatorState>();

class HomeNestedRoute {
  static const home = '/';
  static const songDetail = '/song-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      home: (ctx) => Home(),
      songDetail: (ctx) => SongDetail(song: settings.arguments),
    };
    WidgetBuilder builder = routes[settings.name];

    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

///
final personNestedKey = GlobalKey<NavigatorState>();

class PersonNestedRoute {
  static const personal = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      personal: (ctx) => Personal(),
    };
    WidgetBuilder builder = routes[settings.name];

    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}