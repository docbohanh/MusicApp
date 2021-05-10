import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/router/router.dart';
import 'package:music_app/service/locator.dart';
import 'package:music_app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      title: 'DJCloud Music App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: MyRouter.root,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}