import 'package:flutter/material.dart';
import 'package:music_app/components/bottom_bar.dart';
import 'package:music_app/pages/home/home.dart';
import 'package:music_app/pages/music/miniplayer.dart';
import 'package:music_app/pages/music/player.dart';
import 'package:music_app/pages/person/personal.dart';
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
  int _bottomIndex = 0;

  final _pageController = PageController();
  final homeUI = HomeNested();
  final personUI = PersonNested();

  @override
  void initState() {
    miniService.init(this);

    animation = Tween<double>(begin: 0, end: 1)
        .animate(miniService.animController)
          ..addListener(() => setState(() {}));

    super.initState();
  }

  void changeHomePageTo(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  mainBody(int index) {
    switch (index) {
      case 1:
        return personUI;
        break;
      default:
        return homeUI;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double _panelMinSize =
        kToolbarHeight * 2 + MediaQuery.of(context).padding.bottom;
    final double _panelMaxSize = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: WeSlide(
        controller: miniService.slideController,
        panelMinSize: _panelMinSize * animation.value,
        panelMaxSize: _panelMaxSize,
        overlayOpacity: 0.66,
        overlay: true,
        body: mainBody(_bottomIndex),
        // body: PageView(
        //   physics: NeverScrollableScrollPhysics(),
        //   controller: _pageController,
        //   children: [
        //     HomeNested(),
        //     PersonNested(),
        //   ],
        // ),
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
            setState(() => _bottomIndex = index);
            // changeHomePageTo(index);
          },
        ),
        footerHeight: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        appBarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
      ),
    );
  }
}
