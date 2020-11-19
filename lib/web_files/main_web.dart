import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'web_screen/first_screen_web.dart';

class WebMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return MaterialApp(
                home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FirstScreen(),
          );
        });
  }
}
