import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './courses.dart';

class Courses with ChangeNotifier {
  List<Course> _courseData = [];
  List<Course> _myCourses = [];

  String userId;
  //int numberen;
  Courses(this.userId, this._courseData);

  List<Course> get myCourses {
    print(_myCourses);
    return [..._myCourses];
  }

  Future<bool> loadmycourse() async {
    final url = 'https://........./allusers/$userId/enrolledCourses.json';
    try {
      final response = await http.get(url);
      if (response.statusCode == 404) return false;
      final data = json.decode(response.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        _myCourses.insert(
          0,
          Course(
            coursename: value['coursename'],
            courseContent: value['courseContent'],
            duration: value['duration'],
            id: value['id'],
            isEnrolled: value['isEnrolled'],
            imageUrl: value['imageUrl'],
            overview: value['overview'],
            ratings: value['ratings'],
          ),
        );
      });

      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<void> fetchAndSetCourses() async {
    final url = 'https://.........../allCourses/.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Course> loadedCourse = [];
      extractedData.forEach((courseId, cData) {
        loadedCourse.insert(
            0,
            Course(
              id: courseId,
              category: cData['category'],
              coursename: cData['coursename'],
              courseContent: cData['courseContent'],
              duration: cData['duration'],
              isEnrolled: cData['isEnrolled'],
              imageUrl: cData['imageUrl'],
              overview: cData['overview'],
              ratings: cData['ratings'],
            ));
      });
      _courseData = loadedCourse;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> setRewards(int points) async {
    var url = 'https://........../allusers/$userId.json';
    await http.patch(url, body: json.encode({'reward': points}));
  }

  Future<void> enrollCourse(String courseId) async {
    var url = 'https://............./allusers/$userId/enrolledCourses.json';
    try {
      final enrolledCourse = findById(courseId);

      await http.post(url,
          body: json.encode({
            'id': enrolledCourse.id,
            'coursename': enrolledCourse.coursename,
            'courseContent': enrolledCourse.courseContent,
            'duration': enrolledCourse.duration,
            'isEnrolled': true,
            'imageUrl': enrolledCourse.imageUrl,
            'overview': enrolledCourse.overview,
            'ratings': enrolledCourse.ratings,
          }));

      _myCourses.insert(0, enrolledCourse);

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Course findById(String id) {
    return _courseData.firstWhere((course) => course.id == id);
  }

  List<Course> get courseData {
    return [..._courseData];
  }

  void setasMycourse(Course c) {
    if (c.isEnrolled) {
      _myCourses.insert(0, c);
      notifyListeners();
    }
  }
}
