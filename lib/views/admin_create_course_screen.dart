import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/course.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';

class AdminCreateCourse extends StatefulWidget {
  @override
  _AdminCreateCourseState createState() => _AdminCreateCourseState();
}

class _AdminCreateCourseState extends State<AdminCreateCourse> {
  final _formKey = GlobalKey<FormState>();
  final courseNameController = TextEditingController();
  final courseCodeController = TextEditingController();
  final courseStartDateController = TextEditingController();
  final courseEndDateController = TextEditingController();
  final courseDegreeController = TextEditingController();

  ApiFacultyService get service => GetIt.I<ApiFacultyService>();
  APIResponse<bool> _apiResponse;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    /*
    courseNameController.addListener(_createCourse);
    courseCodeController.addListener(_createCourse);
    courseStartDateController.addListener(_createCourse);
    courseEndDateController.addListener(_createCourse);
    courseDegreeController.addListener(_createCourse);
  */
  }

  createCourse() async {
    setState(() {
      _isSending = true;
    });

    final courseCreate = Course(
      courseName: courseNameController.text,
      courseCode: courseCodeController.text,
      courseStartDate: courseStartDateController.text,
      courseEndDate: courseEndDateController.text,
      degree: int.parse(courseDegreeController.text),
      //archived: false,
    );
    final _apiResponse = await service.createCourse(courseCreate);
    setState(() {
      _isSending = false;
    });

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the that user has entered by using the
          // TextEditingController.
          content: (_apiResponse.data)
              ? Text('Course created.')
              : Text('Error, ${_apiResponse.errorMessage}.'),
        );
      },
    );
  }

  @override
  void dispose() {
    courseNameController.dispose();
    courseCodeController.dispose();
    courseStartDateController.dispose();
    courseEndDateController.dispose();
    courseDegreeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('Admin Create Course'),
      ),
      body: Builder(
        builder: (_) {
          if (_isSending == null || _isSending == true) {
            return Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(height: 20),
                  Text('Create new course'),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text('Course name:'),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: courseNameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text('Course code:'),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: courseCodeController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text('Startdate:'),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: courseStartDateController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text('EndDate:'),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: courseEndDateController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text('Degree:'),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: courseDegreeController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        createCourse();
                      }
                    },
                    child: Text('Create'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
