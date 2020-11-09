class StudentUser {
  int id;
  String studentId;
  String studentName;
  String studentEmail;
  String studentClass;

  StudentUser(
      {this.id,
      this.studentId,
      this.studentName,
      this.studentEmail,
      this.studentClass});

  factory StudentUser.fromJson(Map<String, dynamic> item) {
    return StudentUser(
      id: item['ID'],
      studentId: item['StudentID'],
      studentName: item['StudentName'],
      studentEmail: item['StudentEmail'],
      studentClass: item['StudentClass'],
    );
  }
}
