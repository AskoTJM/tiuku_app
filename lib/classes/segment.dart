// Segment from HTTP Request

class Segment {
  int id;
  int courseId;
  String segmentName;
  int teacherId;
  int scope;
  int expectedAttendance;
  bool archived;

  Segment(
      {this.id,
      this.courseId,
      this.segmentName,
      this.teacherId,
      this.scope,
      this.expectedAttendance,
      this.archived});

  factory Segment.fromJson(Map<String, dynamic> item) {
    return Segment(
        id: item['ID'],
        courseId: item['CourseID'],
        segmentName: item['SegmentName'],
        teacherId: item['TeacherID'],
        scope: item['Scope'],
        expectedAttendance: item['ExpectedAttendance'],
        archived: item['Archived']);
  }

  Map<String, dynamic> toJson() {
    return {
      "SegmentName": segmentName,
      "CourseID": courseId,
      "TeacherID": teacherId,
      "Scope": scope,
      "ExpectedAttendance": expectedAttendance,
      "Archived": archived,
    };
  }
}

class StudentSegmentTable {
  int id;
  int courseId;
  int segmentId;
  bool archived;
  StudentSegmentTable({this.id, this.courseId, this.segmentId, this.archived});

  factory StudentSegmentTable.fromJson(Map<String, dynamic> item) {
    return StudentSegmentTable(
      id: item['ID'],
      courseId: item['CourseID'],
      segmentId: item['SegmentID'],
      archived: item['Archived'],
    );
  }
}

class StudentSegmentViewData {
  String segmentName;
  int segmentId;
  String courseName;
  int courseId;
  String facultyName;
  int scope;
  bool archived;
  StudentSegmentViewData(this.segmentName, this.segmentId, this.courseName,
      this.courseId, this.facultyName, this.scope, this.archived);
}
