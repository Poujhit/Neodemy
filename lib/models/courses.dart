class Course {
  final String coursename;
  final String id;
  final String ratings;

  final int duration;
  final String imageUrl;
  final String overview;
  final String category;
  bool isEnrolled;
  List<dynamic> courseContent;
  final String assignmentUrl;

  Course({
    this.assignmentUrl,
    this.courseContent,
    this.coursename,
    this.duration,
    this.id,
    this.category,
    this.imageUrl,
    this.isEnrolled,
    this.overview,
    this.ratings,
  });
}
