import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './models/course_provider.dart';

//for building the apk run flutter build apk --split-per-abi

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Courses(),
      builder: (context, _) => MaterialApp(
        title: 'Neodemy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Exo',
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                //color: Color(0xAA324148),
                color: Colors.black),
            subtitle1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            subtitle2: TextStyle(
              fontSize: 10,
              color: Color(0xAA555555),
            ),
            headline2: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            headline4: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            caption: TextStyle(
              fontSize: 14,
              color: Color(0xAA555555),
            ),
          ),
        ),
        home: HomeUi(),
      ),
    );
  }
}
