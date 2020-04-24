import 'package:flutter/material.dart';
import 'package:new_reader/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S.G. News',
      theme: ThemeData(
        // brightness: Brightness.dark
        primaryColor: Colors.white
      ),
      home: Home(),
    );
  }
}