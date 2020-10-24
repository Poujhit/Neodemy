import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/course_provider.dart';

class CourseContentScreen extends StatefulWidget {
  @override
  _CourseContentScreenState createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  var p;

  @override
  Widget build(BuildContext context) {
    final courseId = ModalRoute.of(context).settings.arguments as String;

    final course = Provider.of<Courses>(context, listen: false).findById(courseId);
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey(course.id))
        setState(() {
          p = value.getString(course.id);
        });
      else
        setState(() {
          p = null;
        });
    });

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.30 -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              stretch: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.grey[200],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: course.id,
                      child: Image.network(
                        course.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 15,
                        bottom: 15,
                      ),
                      child: AutoSizeText(
                        course.coursename,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Overview of the Course:',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          AutoSizeText(
                            '\n${course.overview}',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  p != null
                      ? Text('')
                      : Container(
                          //alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 40,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            elevation: 3,
                            onPressed: () async {
                              SharedPreferences pref = await SharedPreferences.getInstance();

                              await Provider.of<Courses>(context, listen: false).enrollCourse(courseId);
                              pref.setString(course.id, 'pikachu');
                              setState(() {
                                p = pref.getString(course.id);
                              });
                              showGeneralDialog(
                                  barrierDismissible: true,
                                  barrierLabel: 'lalala',
                                  context: context,
                                  pageBuilder: (ctx, _, __) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(15),
                                            child: const Text(
                                              'Enrolled!! Happy Learning',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(thickness: 1),
                                          GestureDetector(
                                            onTap: () => Navigator.of(ctx).pop(),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      bottom: 5,
                                                    ),
                                                    child: FlatButton(
                                                      onPressed: () => Navigator.of(ctx).pop(),
                                                      child: Text(
                                                        'OK',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'ENROLL',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 15,
                          bottom: 15,
                        ),
                        child: Column(
                          children: [
                            AutoSizeText(
                              'Course Contents:',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Expanded(
                              child: Scrollbar(
                                child: ListView(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  children: course.courseContent.map((eachCourseContent) {
                                    return Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      //shadowColor: Colors.white,
                                      child: ListTile(
                                        title: Text(
                                          eachCourseContent['title'],
                                        ),
                                        trailing: Icon(Icons.play_arrow_sharp),
                                        onTap: () {
                                          if (p != null)
                                            Navigator.of(context).pushNamed('/videoScreen', arguments: {
                                              'videoTitle': eachCourseContent['title'],
                                              'videoUrl': eachCourseContent['videoUrl'],
                                              'minutes': eachCourseContent['minutes'],
                                              'isWatched': eachCourseContent['isWatched'],
                                            });
                                          else
                                            Fluttertoast.showToast(msg: 'Enroll for the course to see the video.');
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
