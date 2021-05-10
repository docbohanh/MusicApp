import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/router/router.dart';

class LoadApp extends StatefulWidget {
  const LoadApp();

  @override
  _LoadAppState createState() => _LoadAppState();
}

class _LoadAppState extends State<LoadApp> {

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadApp() async {
    await Future.delayed(Duration(seconds: 1));
    navigateToMainPage();
  }

  navigateToMainPage() {
    navigatorKey.currentState.pushReplacementNamed(MyRouter.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
