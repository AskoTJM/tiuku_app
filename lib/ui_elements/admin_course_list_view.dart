import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/course.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';
import 'package:tiuku_app/views/admin_segments_screen.dart';

class AdminCourseList extends StatefulWidget {
  const AdminCourseList({Key key, this.courseChoice}) : super(key: key);
  final String courseChoice;
  //AdminCourseList(this.courseChoice);
  @override
  _AdminCourseListState createState() => _AdminCourseListState();
}

class _AdminCourseListState extends State<AdminCourseList> {
  String errorMessage;
  String choice;
  // bool get isEditing => widget.segmentID != null;
  ApiFacultyService get service => GetIt.I<ApiFacultyService>();

  APIResponse<List<Course>> _apiResponse;
  bool _isLoading = false;
  var courses = <Course>[];

  @override
  void initState() {
    //print(widget.segmentID);
    choice = widget.courseChoice;
    _fetchSessions();
    super.initState();
  }

  _fetchSessions() async {
    setState(() {
      _isLoading = true;
    });
    //print(widget.courseChoice.toString());
    //print(choice);
    if (choice == "CourseChoice.archived") {
      //print('archived');
      _apiResponse = await service.getArchivedCourses();
    } else {
      //print(widget.courseChoice);
      _apiResponse = await service.getCourses();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            separatorBuilder: (_, __) => Divider(
              height: 10,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                //child: Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      globals.DefaultListSideBorderPadding,
                      globals.DefaultListTopMostPadding - 10,
                      globals.DefaultListSideBorderPadding,
                      globals.DefaultListTopMostPadding - 10),
                  //width: MediaQuery.of(context).size.width,

                  //padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.values,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              //width: globals.SegmentListSpacing,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                _apiResponse.data[index].courseName,
                                style: TextStyle(
                                    fontSize:
                                        globals.DefaultSessionsListFontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Container(
                              //width: globals.SegmentListSpacing,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                _apiResponse.data[index].courseCode,
                                style: TextStyle(
                                    fontSize:
                                        globals.DefaultSessionsListFontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              //width: globals.SegmentListSpacing,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                _apiResponse.data[index].degree.toString(),
                                style: TextStyle(
                                    fontSize:
                                        globals.DefaultListSecondRowFontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white54,
                  ),
                ),
                //),

                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AdminSegmentsScreen(
                        _apiResponse.data[index].id.toString()),
                  ),
                ),
              );
            },
            itemCount: _apiResponse.data.length,
          );
  }
}
