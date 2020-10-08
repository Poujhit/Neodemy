import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './models/course_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Exo',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xAA324148),
          ),
          subtitle1: TextStyle(
            fontSize: 12,
            color: Color(0xAA555555),
          ),
          subtitle2: TextStyle(
            fontSize: 10,
            color: Color(0xAA555555),
          ),
          headline2: TextStyle(
            fontSize: 14,
            color: Color(0xAA5F5F5F),
          ),
          headline3: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          caption: TextStyle(
            fontSize: 8,
            color: Color(0xAA555555),
          ),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => Courses(),
        child: HomeUi(),
      ),
    );
  }
}
