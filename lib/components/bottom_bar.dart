import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTap;

  const BottomBar({Key key, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarState();

}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: r'Trang chủ'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: r'Cá nhân'),
      ],
      elevation: 0,
      backgroundColor: colorTheme.surface,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorTheme.onPrimary,
      unselectedItemColor: colorTheme.onPrimary.withOpacity(0.5),
      //Colors.grey,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onTap(index);
      },
    );
  }

}