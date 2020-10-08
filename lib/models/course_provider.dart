import 'package:flutter/foundation.dart';

import './courses.dart';

class Courses with ChangeNotifier {
  List<Course> _courseData = [
    Course(
      coursename: 'Understanding TypeScript - 2020 Edition',
      duration: 15,
      imageUrl: 'assets/images/one.png',
      overview:
          'Don\'t limit the Usage of TypeScript to Angular! Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.7',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Understanding Angular - 2019 Edition',
      duration: 30,
      imageUrl: 'assets/images/two.png',
      overview: 'Don\'t limit the Usage of angular! Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.2',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Flutter bootcamp',
      duration: 45,
      imageUrl: 'assets/images/three.png',
      overview: 'Learn flutter. Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.4',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Adobe premier',
      duration: 10,
      imageUrl: 'assets/images/four.png',
      overview:
          'lalala surviva lalala survivalalala survivalalala survivavvvlalala survivalalala survivalalala survivalalala survivavlalala survivalalala survivavlalala survivav',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.0',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Learn Something',
      duration: 50,
      imageUrl: 'assets/images/five.png',
      overview: 'Pikachu is the best pokemon. Learn magic. Learn whatever you want. Subscribe to anything.',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '3.7',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Dont take Engineering.',
      duration: 800,
      imageUrl: 'assets/images/six.png',
      overview:
          'Dont take Engineering.Dont take Engineering.Dont take Engineering.Dont take Engineering.vvvDont take Engineering.Dont take Engineering.Dont take Engineering.Dont take Engineering.Dont take Engineering.',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '5.0',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
  ];
  List<Course> _myCourses = [
    Course(
      coursename: 'Understanding TypeScript - 2020 Edition',
      duration: 15,
      imageUrl: 'assets/images/one.png',
      overview:
          'Don\'t limit the Usage of TypeScript to Angular! Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.7',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Understanding Angular - 2019 Edition',
      duration: 30,
      imageUrl: 'assets/images/two.png',
      overview: 'Don\'t limit the Usage of angular! Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.2',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
    Course(
      coursename: 'Flutter bootcamp',
      duration: 45,
      imageUrl: 'assets/images/three.png',
      overview: 'Learn flutter. Learn the Basics, its Features, Workflows and how to use it!',
      id: DateTime.now().toString(),
      isEnrolled: false,
      assignmentUrl: 'https//www.udemy.com',
      ratings: '4.4',
      courseContent: [
        {
          'title': 'Welcome to the course',
          'minutes': 12,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 1',
          'minutes': 10,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid2',
          'minutes': 9,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid 3',
          'minutes': 8,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
        {
          'title': 'vid4',
          'minutes': 7,
          'videoUrl': 'now nothing',
          'isWatched': false,
        },
      ],
    ),
  ];

  List<Course> get myCourses {
    return [..._myCourses];
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
