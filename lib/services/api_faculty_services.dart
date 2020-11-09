import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/category.dart';
import 'package:tiuku_app/classes/course.dart';
import 'package:tiuku_app/classes/faculty_user.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/classes/session.dart';
import 'package:tiuku_app/classes/student_user.dart';

class ApiFacultyService {
  static const facultyAPI = 'http://10.0.2.2:8080/faculty/v1';
  static const facultyHeaders = {
    'X-User': 'ope1',
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': '*/*',
    'Connection': 'keep-alive',
  };

  Future<APIResponse<List<StudentSegmentViewData>>> getSegments(
      String courseId) async {
    return http
        .get(facultyAPI + '/courses/' + courseId + '/segments',
            headers: facultyHeaders)
        .then((data) async {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final segments = <StudentSegmentViewData>[];
        for (var item in jsonData) {
          APIResponse<FacultyUser> responseFaculty =
              await getFaculty(item['teacherId']);
          var segment = StudentSegmentViewData(
              item['SegmentName'],
              item['ID'],
              item['CourseName'],
              item['CourseID'],
              responseFaculty.data.facultyName,
              item['Scope'],
              item['Archived']);

          segments.add(segment);
        }
        return APIResponse<List<StudentSegmentViewData>>(data: segments);
      }
      return APIResponse<List<StudentSegmentViewData>>(
          error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<StudentSegmentViewData>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<Session>>> getSessions(String segmentID) {
    return http
        .get(facultyAPI + '/segments/' + segmentID + '/sessions',
            headers: facultyHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final sessions = <Session>[];
        for (var item in jsonData) {
          sessions.add(Session.fromJson(item));
        }
        return APIResponse<List<Session>>(data: sessions);
      }

      return APIResponse<List<Session>>(error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<Session>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<SessionReport>>> getSessionsForSegment(
      StudentSegmentViewData segData) async {
    return http
        .get(
            facultyAPI +
                '/courses/' +
                segData.courseId.toString() +
                '/segments/' +
                segData.segmentId.toString() +
                '/sessions',
            headers: facultyHeaders)
        .then((data) async {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final sessions = <SessionReport>[];
        for (var item in jsonData) {
          APIResponse<Category> responseCategory = await getCategory(
              segData.courseId, segData.segmentId, item['Category']);
          var tempSession = new SessionReport(
              item['StudentID'],
              item['ResourceID'],
              item['SegmentID'],
              item['Category'],
              responseCategory.data.subCategory,
              item['StartTime'],
              item['EndTime'],
              item['Created'],
              item['Updated'],
              item['Comment']);
          sessions.add(tempSession);
        }
        return APIResponse<List<SessionReport>>(data: sessions);
      }

      return APIResponse<List<SessionReport>>(
          error: true, errorMessage: 'An error! ! ${data.statusCode}');
    }).catchError((err) => APIResponse<List<SessionReport>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<StudentSegmentViewData>>> getMySegments() async {
    return http
        .get(facultyAPI + '/segments', headers: facultyHeaders)
        .then((data) async {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final segments = <StudentSegmentViewData>[];
        //StudentSegmentViewData segmentViewData;
        for (var item in jsonData) {
          APIResponse<Segment> responseSegment = await getSegment(item);
          APIResponse<Course> responseCourse =
              await getCourse(responseSegment.data.courseId);
          APIResponse<FacultyUser> responseFaculty =
              await getFaculty(responseSegment.data.teacherId);

          //StudentSegmentViewData segmentViewData;
          //if (responseSegment != null) {
          StudentSegmentViewData segmentViewData = new StudentSegmentViewData(
              responseSegment.data.segmentName,
              responseSegment.data.id,
              responseCourse.data.courseName,
              responseSegment.data.courseId,
              responseFaculty.data.facultyName,
              responseSegment.data.scope,
              responseCourse.data.archived);

          segments.add(segmentViewData);
        }
        if (segments.length == 0) {
          return APIResponse<List<StudentSegmentViewData>>(
              error: true, errorMessage: 'No joined Segments');
        }
        return APIResponse<List<StudentSegmentViewData>>(data: segments);
      }
      return APIResponse<List<StudentSegmentViewData>>(
          error: true, errorMessage: 'An error!!');
    }).catchError((err) => APIResponse<List<StudentSegmentViewData>>(
            error: true, errorMessage: 'An error!!! $err'));
  }

  Future<APIResponse<Segment>> getSegment(item) async {
    Segment segment;
    var data = await http.get(
        facultyAPI +
            '/courses/' +
            item['CourseID'].toString() +
            '/segments/' +
            item['ID'].toString(),
        headers: facultyHeaders);

    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      segment = Segment.fromJson(jsonData);
      return APIResponse<Segment>(data: segment);
    } else if (data.statusCode == 404) {
      return APIResponse<Segment>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Segment>(error: true, errorMessage: 'An error!');
  }

  Future<APIResponse<FacultyUser>> getFaculty(int teacherId) async {
    FacultyUser facultyUser;
    var data = await http.get(facultyAPI + '/faculty/' + teacherId.toString(),
        headers: facultyHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      facultyUser =
          FacultyUser.fromJson(jsonData[0]); //FacultyUser.fromJson(jsonData);
      return APIResponse<FacultyUser>(data: facultyUser);
    } else if (data.statusCode == 404) {
      return APIResponse<FacultyUser>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<FacultyUser>(error: true, errorMessage: 'An error!');
  }

  Future<APIResponse<Course>> getCourse(int courseId) async {
    Course course;
    var data = await http.get(facultyAPI + '/courses/' + courseId.toString(),
        headers: facultyHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      course = Course.fromJson(jsonData);
      return APIResponse<Course>(data: course);
    } else if (data.statusCode == 404) {
      return APIResponse<Course>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Course>(error: true, errorMessage: 'An error!');
  }

  Future<APIResponse<Category>> getCategory(
      int courseId, int segmentId, int categoryId) async {
    Category category;
    var data = await http.get(
        facultyAPI +
            '/courses/' +
            courseId.toString() +
            '/segments/' +
            segmentId.toString() +
            '/categories/' +
            categoryId.toString(),
        headers: facultyHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      category = Category.fromJson(jsonData);
      return APIResponse<Category>(data: category);
    } else if (data.statusCode == 404) {
      return APIResponse<Category>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Category>(error: true, errorMessage: 'An error!');
  }

  Future<APIResponse<List<Course>>> getCourses() async {
    return http
        .get(facultyAPI + '/courses/', headers: facultyHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final courses = <Course>[];
        for (var item in jsonData) {
          courses.add(Course.fromJson(item));
        }
        return APIResponse<List<Course>>(data: courses);
      }
      return APIResponse<List<Course>>(error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<Course>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<Course>>> getArchivedCourses() async {
    return http
        .get(facultyAPI + '/courses?archived=only', headers: facultyHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final courses = <Course>[];
        for (var item in jsonData) {
          courses.add(Course.fromJson(item));
        }
        return APIResponse<List<Course>>(data: courses);
      }
      return APIResponse<List<Course>>(error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<Course>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<StudentUser>>> getStudents() async {
    return http
        .get(facultyAPI + '/students', headers: facultyHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final students = <StudentUser>[];
        for (var item in jsonData) {
          students.add(StudentUser.fromJson(item));
        }
        return APIResponse<List<StudentUser>>(data: students);
      }
      return APIResponse<List<StudentUser>>(
          error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<StudentUser>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<List<FacultyUser>>> getFacultyUsers() async {
    return http
        .get(facultyAPI + '/faculty', headers: facultyHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final faculty = <FacultyUser>[];
        for (var item in jsonData) {
          faculty.add(FacultyUser.fromJson(item));
        }
        return APIResponse<List<FacultyUser>>(data: faculty);
      }
      return APIResponse<List<FacultyUser>>(
          error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<FacultyUser>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  Future<APIResponse<bool>> createCourse(Course course) async {
    return http
        .post(facultyAPI + '/courses',
            headers: facultyHeaders, body: json.encode(course.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: false,
          error: true,
          errorMessage: 'An error! ${data.statusCode}');
    }).catchError((err) => APIResponse<bool>(
            data: false, error: true, errorMessage: 'An error!! $err'));
  }

  // Create Segment, needs new Segment data and course who it belongs to.
  Future<APIResponse<bool>> createSegment(Segment segment) async {
    return http
        .post(
            facultyAPI +
                '/courses/' +
                segment.courseId.toString() +
                '/segments',
            headers: facultyHeaders,
            body: json.encode(segment.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: false,
          error: true,
          errorMessage: 'An error! ${data.statusCode}');
    }).catchError((err) => APIResponse<bool>(
            data: false, error: true, errorMessage: 'An error!! $err'));
  }
}
