import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_appbar.dart';
import '../models/course_provider.dart';

class ViewAllMyCourseScreen extends StatelessWidget {
  final List<Color> _colors = [
    Color(0xAA1E969C),
    Color(0xAA324148),
  ];

  @override
  Widget build(BuildContext context) {
    int i = -1;
    final courseData = Provider.of<Courses>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar('My Courses'),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  i++;
                  if (i == 2) i = 0;
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/coursecontent',
                      arguments: courseData.courseData[index].id,
                    ),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: _colors[i],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 11,
                                left: 2,
                              ),
                              child: Text(
                                courseData.myCourses[index].coursename,
                                style: Theme.of(context).textTheme.headline3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
                                  child: Text(
                                    '${courseData.myCourses[index].duration} Hours Course',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: courseData.myCourses.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
