
import 'package:flutter/material.dart';
import 'package:music_app/pages/load_app/load_app.dart';
import 'package:music_app/pages/main/main.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyRouter {
  static const root = '/';
  static const main = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      root: (ctx) => LoadApp(),
      main: (ctx) => MainPage(),
    };
    WidgetBuilder builder = routes[settings.name];

    if (settings.name == main) {
      return NoAnimationPageRoute(builder: (ctx) => builder(ctx));
    } else {
      return MaterialPageRoute(builder: (ctx) => builder(ctx));
    }
  }
}


/// NoAnimationPageRoute
class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
      builder: builder,
      maintainState: maintainState,
      settings: settings,
      fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}

///
class FadeTransitionPageRoute<T> extends MaterialPageRoute<T> {
  FadeTransitionPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
      builder: builder,
      maintainState: maintainState,
      settings: settings,
      fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);
}

///
class SlideRightTransitionPageRoute<T> extends MaterialPageRoute<T> {
  SlideRightTransitionPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
      builder: builder,
      maintainState: maintainState,
      settings: settings,
      fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

