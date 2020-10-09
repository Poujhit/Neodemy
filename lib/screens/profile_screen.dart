import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';

import './view_all_mycourse_screen.dart';
import '../widgets/title_header.dart';
import '../widgets/my_courses_cards.dart';
import '../widgets/bottom_navbar.dart';
import '../models/course_provider.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'profile';

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
    final courseData = Provider.of<Courses>(context, listen: false);
    print(courseData.myCourses.length);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          splashRadius: 25,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Text(
          'PROFILE',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 6,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
                child: CircleAvatar(
                  // backgroundImage: AssetImage(
                  //   'assets/images/logo.png',
                  // ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 55,
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 40,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'username',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                //implmentation of reward system.
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                'View Your Rewards',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TitleHeader(
                'Your Courses',
                () => Navigator.of(context).push(
                      _createRoute(
                        ViewAllMyCourseScreen(),
                      ),
                    ),
                courseData.myCourses.length != 0 ? true : false),
            SizedBox(
              height: 10,
            ),
            courseData.myCourses.length != 0
                ? MyCourseCards()
                : Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Enroll to See your Courses here.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            //https://drive.google.com/drive/u/5/folders/1Z9CBxsJ3Jzls4XCmAKxIeJ4Mg_6xALfI
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    thickness: 0.6,
                    color: Colors.grey,
                    height: 0,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Share the Neodemy App',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text('Share it with your friends or anyone who wants to learn online'),
                    onTap: () async {
                      await Share.share(
                        'https://drive.google.com/drive/u/5/folders/1Z9CBxsJ3Jzls4XCmAKxIeJ4Mg_6xALfI',
                        subject: 'A Learning App',
                      );
                    },
                  ),
                  Divider(
                    thickness: 0.6,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.30,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                elevation: 3,
                onPressed: () {
                  //implement logout feature.
                  Navigator.of(context).pop('signnout');
                },
                child: Text(
                  'SIGN OUT',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (name != 'profile')
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            );
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
