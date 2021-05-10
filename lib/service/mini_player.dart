import 'package:flutter/material.dart';
import 'package:music_app/service/locator.dart';
import 'package:music_app/we_slide/weslide_controller.dart';

final miniService = locator<MiniPlayerService>();

class MiniPlayerService {
  AnimationController animController;
  bool isVisible = false;

  final WeSlideController slideController = WeSlideController();

  void init(TickerProvider ticker) {
    animController = AnimationController(
      duration: Duration(milliseconds: 222),
      vsync: ticker,
    );
  }

  /// Open Music Player Full Screen
  void expand() {
    slideController.show();
  }

  /// Show mini player
  void mini() {
    slideController.hide();
  }

  /// Show mini view
  void show() {
    animController.forward();
    isVisible = true;
  }

  /// Hide mini view
  void hide() {
    if (isVisible) {
      isVisible = false;
      animController.reverse();
    }
  }
}
