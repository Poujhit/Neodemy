import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/course_provider.dart';

class MyCourseCards extends StatelessWidget {
  final List<Color> _colors = [
    Color(0xAA1E969C),
    Color(0xAA324148),
  ];

  @override
  Widget build(BuildContext context) {
    int i = -1;

    final courseData = Provider.of<Courses>(context);
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        children: courseData.myCourses.map((eachCourse) {
          i++;

          if (i == 2) i = 0;
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/coursecontent', arguments: eachCourse.id),
            child: Container(
              width: 170,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 10,
                shadowColor: Colors.white,
                color: _colors[i],
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 11,
                      ),
                      child: Text(
                        eachCourse.coursename,
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 5,
                            ),
                            child: Icon(
                              Icons.alarm,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AutoSizeText(
                            '${eachCourse.duration} Hours Course',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
