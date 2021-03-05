import 'package:elearn_app/screens/video_screen_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  firebaseAnalytics = FirebaseAnalytics();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget layoutChecker({Widget widget}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600 && constraints.maxHeight < 850) {
          return widget;
        } else
          return Center(
            child: Text(
              'Desktop mode is not supported yet. Run the website in a mobile phone as this is a PWA.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xAA1D9398),
                decoration: TextDecoration.none,
                fontFamily: 'Exo',
              ),
            ),
          );
      },
    );
  }

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
            primaryColor: const Color(0xFF1D9398),
            fontFamily: 'Exo',
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
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
              ? layoutChecker(widget: HomeUi())
              : layoutChecker(
                  widget: FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting ? LoadingScreen() : AuthScreen(),
                  ),
                ),
          routes: {
            '/coursecontent': (ctx) => CourseContentScreen(),
            '/videoScreen': (ctx) => VideoScreen(),
            '/videoScreenWeb': (ctx) => VideoScreenWeb(),
          },
        );
      }),
    );
  }
}
