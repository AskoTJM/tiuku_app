class Session {
  int resourceId;
  int segmentId;
  int category;
  String startTime;
  String endTime;
  String created;
  String updated;
  String deleted;
  String comment;
  int version;
  String location;
  bool privacy;

  Session(
      {this.resourceId,
      this.segmentId,
      this.category,
      this.startTime,
      this.endTime,
      this.created,
      this.updated,
      this.deleted,
      this.comment,
      this.version,
      this.location,
      this.privacy});

  factory Session.fromJson(Map<String, dynamic> item) {
    return Session(
      resourceId: item['ResourceID'],
      segmentId: item['SegmentID'],
      category: item['Category'],
      startTime: item['StartTime'],
      endTime: item['EndTime'],
      created: item['Created'],
      updated: item['Updated'],
      deleted: item['Deleted'],
      comment: item['Comment'],
      version: item['Version'],
      location: item['Locations'],
      privacy: item['Privacy'],
    );
  }
}

class SessionReport {
  String studentName;
  int resourceId;
  int segmentId;
  int categoryId;
  String categoryName;
  String startTime;
  String endTime;
  String created;
  String updated;
  String comment;

  SessionReport(
      this.studentName,
      this.resourceId,
      this.segmentId,
      this.categoryId,
      this.categoryName,
      this.startTime,
      this.endTime,
      this.created,
      this.updated,
      this.comment);
/*
  factory SessionReport.fromJson(Map<String, dynamic> item) {
    return SessionReport(
      studentId: item['studentId'],
      resourceId: item['ResourceID'],
      segmentId: item['SegmentID'],
      categoryId: item['Category'],
      categoryName:
      startTime: item['StartTime'],
      endTime: item['EndTime'],
      created: item['Created'],
      updated: item['Updated'],
      comment: item['Comment'],
    );
  }
 */
}
