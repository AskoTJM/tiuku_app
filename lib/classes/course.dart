class Course {
  int id;
  int degree;
  String courseCode;
  String courseName;
  String courseStartDate;
  String courseEndDate;
  bool archived;

  Course(
      {this.id,
      this.degree,
      this.courseCode,
      this.courseName,
      this.courseStartDate,
      this.courseEndDate,
      this.archived = false});

  factory Course.fromJson(Map<String, dynamic> item) {
    return Course(
        id: item['ID'],
        degree: item['Degree'],
        courseCode: item['CourseCode'],
        courseName: item['CourseName'],
        courseStartDate: item['CourseStartDate'],
        courseEndDate: item['CourseEndDate'],
        archived: item['Archived']);
  }

  Map<String, dynamic> toJson() {
    return {
      "CourseCode": courseCode,
      "CourseName": courseName,
      "Degree": degree,
      "CourseStartDate": courseStartDate,
      "CourseEndDate": courseEndDate,
      "Archived": archived,
    };
  }
}

class AdminCourseView {
  int id;
  String degree;
  String courseCode;
  String courseName;
  DateTime courseStartDate;
  DateTime courseEndDate;
  bool archived;

  AdminCourseView(
      {this.id,
      this.degree,
      this.courseCode,
      this.courseName,
      this.courseStartDate,
      this.courseEndDate,
      this.archived});

  factory AdminCourseView.fromJson(Map<String, dynamic> item) {
    return AdminCourseView(
        id: item['ID'],
        degree: item['Degree'],
        courseCode: item['CourseCode'],
        courseName: item['CourseName'],
        courseStartDate: item['CourseStartDate'],
        courseEndDate: item['CourseEndDate'],
        archived: item['Archived']);
  }
}
