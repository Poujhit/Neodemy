import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navbar.dart';
import '../models/course_provider.dart';
import '../widgets/my_courses_cards.dart';
import '../widgets/all_courses.dart';

class HomeUi extends StatelessWidget {
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
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: IconButton(
              icon: Icon(
                Icons.more_vert_sharp,
                color: Colors.black,
              ),
              splashRadius: 25,
              onPressed: () {},
            ),
          ),
        ],
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
                      TitleHeader('My Courses'),
                      SizedBox(
                        height: 7,
                      ),
                      MyCourseCards(),
                    ],
                  ),
            SizedBox(
              height: 27,
            ),
            TitleHeader('Courses'),
            SizedBox(
              height: 7,
            ),
            AllCourseCard(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2,
        tooltip: 'Profile Page',
        backgroundColor: Colors.white,
        child: Container(
          width: 35,
          height: 35,
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class TitleHeader extends StatelessWidget {
  final String title;
  TitleHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 30),
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ],
    );
  }
}
