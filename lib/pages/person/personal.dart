import 'package:flutter/material.dart';
import 'package:music_app/router/nested_route.dart';

class Personal extends StatefulWidget {
  Personal();

  @override
  State createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        backgroundColor: colorTheme.background,
        title: Text(r'Cá nhân', style: TextStyle(fontSize: 16)),
        leading: SizedBox(),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('PERSONAL'),
        ),
      ),
    );
  }
}

class PersonNested extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: personNestedKey,
        initialRoute: PersonNestedRoute.personal,
        onGenerateRoute: PersonNestedRoute.generateRoute,
      ),
    );
  }
}