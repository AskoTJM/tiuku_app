import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_student_services.dart';
import 'package:tiuku_app/views/student_sessions_screen.dart';

class StudentSegmentList extends StatefulWidget {
  @override
  _StudentSegmentListState createState() => _StudentSegmentListState();
}

class _StudentSegmentListState extends State<StudentSegmentList> {
  ApiStudentService get service => GetIt.I<ApiStudentService>();

  APIResponse<List<StudentSegmentViewData>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchSegments();
    super.initState();
  }

  _fetchSegments() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getMySegments();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      if (_isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (_apiResponse.error) {
        return Center(child: Text(_apiResponse.errorMessage));
      }
      return ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 3,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        //flex: 3,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].segmentName != null
                                ? _apiResponse.data[index].segmentName
                                : 'none',
                            style: TextStyle(
                                fontSize: globals.DefaultListFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].courseName != null
                                ? _apiResponse.data[index].courseName
                                : 'none',
                            style: TextStyle(
                                fontSize: globals.DefaultListSecondRowFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Text(
                            _apiResponse.data[index].facultyName != null
                                ? _apiResponse.data[index].facultyName
                                : 'none',
                            style: TextStyle(
                                fontSize: globals.DefaultListSecondRowFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white54,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => StudentSessionsScreen(
                      _apiResponse.data[index].segmentId.toString())),
            ),
          );
        },
        itemCount: _apiResponse.data.length,
      );
    });
  }
}
