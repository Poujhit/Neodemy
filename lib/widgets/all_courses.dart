import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../models/course_provider.dart';

class AllCourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _courses = Provider.of<Courses>(context);
    return Container(
      height: 180,
      margin: EdgeInsets.only(left: 15),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _courses.courseData.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 10,
            shadowColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    _courses.courseData[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            _courses.courseData[index].coursename,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Ratings - ${_courses.courseData[index].ratings}',
                            maxLines: 3,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
