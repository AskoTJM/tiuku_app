class FacultyUser {
  int id;
  String facultyId;
  String facultyName;
  String facultyEmail;
  int apartment;
  bool active;
  bool teacher;
  bool admin;

  FacultyUser(
      {this.id,
      this.facultyId,
      this.facultyName,
      this.facultyEmail,
      this.apartment,
      this.active,
      this.teacher,
      this.admin});

  factory FacultyUser.fromJson(Map<String, dynamic> item) {
    return FacultyUser(
      id: item['ID'],
      facultyId: item['FacultyID'],
      facultyName: item['FacultyName'],
      facultyEmail: item['FacultyEmail'],
      apartment: item['Apartment'],
      active: item['Active'],
      teacher: item['Teacher'],
      admin: item['Admin'],
    );
  }
}
