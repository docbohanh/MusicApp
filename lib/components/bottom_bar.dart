import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(TabItem) onTap;

  const BottomBar({Key key, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<TabItem> items = [TabItem.home, TabItem.profile];

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: items
          .map((e) => BottomNavigationBarItem(
          icon: Icon(activeTabIcon[e]), label: tabName[e]))
          .toList(),
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
        widget.onTap(items[index]);
      },
    );
  }
}

enum TabItem { home, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: r'Trang chủ',
  TabItem.profile: r'Cá nhân',
};

const Map<TabItem, IconData> activeTabIcon = {
  TabItem.home: Icons.home_outlined,
  TabItem.profile: Icons.person_outline,
};
