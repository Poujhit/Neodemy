import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/home_screen.dart';
import './models/course_provider.dart';
import './models/auth.dart';
import './screens/auth_screen.dart';
import './screens/loading_screen.dart';
import './screens/course_content_screen.dart';
import './screens/video_screen.dart';

FirebaseAnalytics firebaseAnalytics;

//for building the apk run flutter build apk --split-per-abi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  firebaseAnalytics = FirebaseAnalytics();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Courses>(
          create: null,
          update: (ctx, auth, previousCourse) => Courses(
            auth.userId, //token is the userid.
            previousCourse == null ? [] : previousCourse.courseData,
          ),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        print(auth.isAuth);
        return MaterialApp(
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
          home: auth.isAuth
              ? HomeUi()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting ? LoadingScreen() : AuthScreen(),
                ),
          routes: {
            '/coursecontent': (ctx) => CourseContentScreen(),
            '/videoScreen': (ctx) => VideoScreen(),
          },
        );
      }),
    );
  }
}
//
