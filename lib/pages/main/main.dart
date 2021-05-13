import 'package:flutter/material.dart';
import 'package:music_app/components/bottom_bar.dart';
import 'package:music_app/pages/music/miniplayer.dart';
import 'package:music_app/pages/music/player.dart';
import 'package:music_app/router/nested_route.dart';
import 'package:music_app/service/mini_player.dart';
import 'package:music_app/we_slide/weslide.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  TabItem _currentTab = TabItem.home;

  @override
  void initState() {
    miniService.init(this);

    animation = Tween<double>(begin: 0, end: 1)
        .animate(miniService.animController)
          ..addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _panelMinSize =
        kToolbarHeight * 2 + MediaQuery.of(context).padding.bottom;
    final double _panelMaxSize = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: WeSlide(
          controller: miniService.slideController,
          panelMinSize: _panelMinSize * animation.value,
          panelMaxSize: _panelMaxSize,
          overlayOpacity: 0.66,
          overlay: true,
          body: Stack(children: [
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.profile),
          ]),
          panelHeader: MiniPlayer(
            onTap: miniService.expand,
            onLike: () {
              print('HEART');
            },
            onPlayOrPause: () => print('PLAY'),
          ),
          panel: NowPlaying(onTap: miniService.mini),
          footer: BottomBar(
            onTap: (index) {
              setState(() => _currentTab = index);
            },
          ),
          footerHeight: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(tabItem: tabItem),
    );
  }
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.tabItem});

  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKeys[tabItem],
        initialRoute: _initialRoutes[tabItem],
        onGenerateRoute: _routeFactories[tabItem],
      ),
    );
  }
}

final _navigatorKeys = {
  TabItem.home: homeNestedKey,
  TabItem.profile: personNestedKey,
};

final _initialRoutes = {
  TabItem.home: HomeNestedRoute.home,
  TabItem.profile: PersonNestedRoute.personal,
};

final _routeFactories = {
  TabItem.home: HomeNestedRoute.generateRoute,
  TabItem.profile: PersonNestedRoute.generateRoute,
};
