import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';

class AdminCreateSegment extends StatefulWidget {
  final String courseId;
  AdminCreateSegment(this.courseId);

  @override
  _AdminCreateSegmentState createState() => _AdminCreateSegmentState();
}

class _AdminCreateSegmentState extends State<AdminCreateSegment> {
  final _formKey = GlobalKey<FormState>();
  final segmentNameController = TextEditingController();
  final segmentTeacherIDController = TextEditingController();
  final segmentScopeController = TextEditingController();
  final segmentExpectedAttendanceController = TextEditingController();

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

  createSegment() async {
    setState(() {
      _isSending = true;
    });

    final segmentCreate = Segment(
      segmentName: segmentNameController.text,
      courseId: int.parse(widget.courseId),
      teacherId: int.parse(segmentTeacherIDController.text),
      scope: int.parse(segmentScopeController.text),
      expectedAttendance: int.parse(segmentExpectedAttendanceController.text),
      archived: false,
    );
    final _apiResponse = await service.createSegment(segmentCreate);
    setState(() {
      _isSending = false;
    });

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: (_apiResponse.data)
              ? Text('Segment created.')
              : Text('Error, ${_apiResponse.errorMessage}.'),
        );
      },
    );
  }

  @override
  void dispose() {
    segmentNameController.dispose();
    segmentTeacherIDController.dispose();
    segmentScopeController.dispose();
    segmentExpectedAttendanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('Admin Create Segment'),
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
                  Text('Create new segment'),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Text('Segment name:'),
                        ),
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            onEditingComplete: () =>
                                node.nextFocus(), // Move focus to next
                            controller: segmentNameController,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Text('TeacherId Number:'),
                        ),
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            onEditingComplete: () => node.nextFocus(),
                            controller: segmentTeacherIDController,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Text('Scope:'),
                        ),
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            onEditingComplete: () => node.nextFocus(),
                            controller: segmentScopeController,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Text('ExpectedAttendance:'),
                        ),
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            onEditingComplete: () => node.nextFocus(),
                            controller: segmentExpectedAttendanceController,
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
                        createSegment();
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
