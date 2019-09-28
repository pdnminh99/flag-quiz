import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/menu_screen.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]); // hide status bar
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New name here',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        canvasColor: Colors.grey[300],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
      },
    );
  }
}
