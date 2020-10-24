import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/course_provider.dart';
import '../widgets/custom_appbar.dart';

class ViewAllCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _courses = Provider.of<Courses>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar('All Courses'),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/coursecontent',
                      arguments: _courses.courseData[index].id,
                    ),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Hero(
                                tag: _courses.courseData[index].id,
                                child: Image.network(
                                  _courses.courseData[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
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
                    ),
                  );
                },
                childCount: _courses.courseData.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
