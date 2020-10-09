import 'package:elearn_app/screens/course_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navbar.dart';
import '../models/course_provider.dart';
import '../widgets/my_courses_cards.dart';
import '../widgets/all_courses.dart';
import './auth_screen.dart';
import './view_all_mycourse_screen.dart';
import './view_allcourses_screem.dart';
import './profile_screen.dart';
import '../widgets/title_header.dart';

class HomeUi extends StatelessWidget {
  final String name = 'home';

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondAnimation) => page,
      transitionsBuilder: (context, animation, secondAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final courseData = Provider.of<Courses>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'HOME',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 17,
            ),
            courseData.myCourses.isEmpty
                ? Text('')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeader(
                        'My Courses',
                        () => Navigator.push(
                          context,
                          _createRoute(
                            ViewAllMyCourseScreen(),
                          ),
                        ),
                        true,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MyCourseCards(),
                      SizedBox(
                        height: 27,
                      ),
                    ],
                  ),
            TitleHeader(
              'Courses',
              () => Navigator.push(
                context,
                _createRoute(
                  ViewAllCourseScreen(),
                ),
              ),
              true,
            ),
            SizedBox(
              height: 7,
            ),
            AllCourseCard(),
            SizedBox(
              height: 27,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => CourseContentScreen()));
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (name != 'profile')
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            )
                .then((value) {
              if (value != null)
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => AuthScreen()));
            });
        },
        elevation: 2,
        tooltip: 'Profile Page',
        backgroundColor: Colors.white,
        child: Container(
          width: 35,
          height: 35,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(name),
    );
  }
}
