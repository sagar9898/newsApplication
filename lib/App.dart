import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewsApp.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: NewsApp(),
    );
  }
}
