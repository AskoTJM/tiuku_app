import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/category.dart';
import 'package:tiuku_app/classes/course.dart';
import 'package:tiuku_app/classes/faculty_user.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/classes/session.dart';

class ApiStudentService {
  static const studentAPI = 'http://10.0.2.2:8080/students/v1';
  static const studentHeaders = {
    'X-User': 'oppi1',
    'Content-Type': 'application/json ; charset=utf-8',
    'Accept': '*/*',
    'Connection': 'keep-alive',
  };
  // Get Segments, just a test to get segments for course 1
  Future<APIResponse<List<Segment>>> getSegments(String courseId) {
    return http
        .get(studentAPI + '/courses/' + courseId + '/segments',
            headers: studentHeaders)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final segments = <Segment>[];
        for (var item in jsonData) {
          segments.add(Segment.fromJson(item));
        }
        return APIResponse<List<Segment>>(data: segments);
      }
      return APIResponse<List<Segment>>(error: true, errorMessage: 'An error!');
    }).catchError((err) => APIResponse<List<Segment>>(
            error: true, errorMessage: 'An error!! $err'));
  }

  // Get all users Sessions with SegmentID
  // W0rks
  Future<APIResponse<List<Session>>> getSessions(String segmentID) {
    return http
        .get(studentAPI + '/segments/' + segmentID + '/sessions',
            headers: studentHeaders)
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

  // GetMySegments, get data for segments I've joined for.
  Future<APIResponse<List<StudentSegmentViewData>>> getMySegments() async {
    return http
        .get(studentAPI + '/segments', headers: studentHeaders)
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

  //Get Segment, input Map with 'CourseID' and 'ID' for segment.
  // W0rks
  Future<APIResponse<Segment>> getSegment(item) async {
    Segment segment;
    var data = await http.get(
        studentAPI +
            '/courses/' +
            item['CourseID'].toString() +
            '/segments/' +
            item['ID'].toString(),
        headers: studentHeaders);

    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      segment = Segment.fromJson(jsonData);
      return APIResponse<Segment>(data: segment);
    } else if (data.statusCode == 404) {
      return APIResponse<Segment>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Segment>(error: true, errorMessage: 'An error!');
  }

  // Get FacultyUser with ID number,
  // W0rks
  Future<APIResponse<FacultyUser>> getFaculty(int teacherId) async {
    FacultyUser facultyUser;
    var data = await http.get(studentAPI + '/faculty/' + teacherId.toString(),
        headers: studentHeaders);
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

  // Get Course with CourseID number,
  Future<APIResponse<Course>> getCourse(int courseId) async {
    Course _course;
    var data = await http.get(studentAPI + '/courses/' + courseId.toString(),
        headers: studentHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      _course = Course.fromJson(jsonData);
      return APIResponse<Course>(data: _course);
    } else if (data.statusCode == 404) {
      return APIResponse<Course>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Course>(error: true, errorMessage: 'An error!');
  }

  // Get Categories with courseId an segmentId
  // T35T, probably need to input IDs for course and Segments
  Future<APIResponse<List<Category>>> getCategories(
      int courseId, int segmentId) async {
    final _categories = <Category>[];
    //Category _category;
    var data = await http.get(
        studentAPI +
            '/courses/' +
            courseId.toString() +
            'segments' +
            segmentId.toString() +
            '/categories',
        headers: studentHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      for (var item in jsonData) {
        _categories.add(Category.fromJson(item));
      }
      //_category = Category.fromJson(jsonData);
      return APIResponse<List<Category>>(data: _categories);
    } else if (data.statusCode == 404) {
      return APIResponse<List<Category>>(
          error: true, errorMessage: 'An error!');
    }
    return APIResponse<List<Category>>(error: true, errorMessage: 'An error!');
  }

  // Get Category, with courseId, segmentId and categoryId,
  // T35T,
  Future<APIResponse<Category>> getCategory(
      int courseId, int segmentId, int categoryId) async {
    //final _categories = <Category>[];
    Category _category;
    var data = await http.get(
        studentAPI +
            '/courses/' +
            courseId.toString() +
            'segments' +
            segmentId.toString() +
            '/categories' +
            categoryId.toString(),
        headers: studentHeaders);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      _category = Category.fromJson(jsonData);
      return APIResponse<Category>(data: _category);
    } else if (data.statusCode == 404) {
      return APIResponse<Category>(error: true, errorMessage: 'An error!');
    }
    return APIResponse<Category>(error: true, errorMessage: 'An error!');
  }
}
