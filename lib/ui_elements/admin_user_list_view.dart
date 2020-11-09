import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/student_user.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';

class AdminUserList extends StatefulWidget {
  final bool students;
  AdminUserList(this.students);

  @override
  _AdminUserListState createState() => _AdminUserListState();
}

class _AdminUserListState extends State<AdminUserList> {
  String errorMessage;

  //bool get isEditing => widget.courseId != null;

  ApiFacultyService get service => GetIt.I<ApiFacultyService>();

  APIResponse<List<StudentUser>> _apiResponse;
  bool _isLoading = false;
  var user = <StudentUser>[];

  @override
  void initState() {
    _fetchSessions();
    super.initState();
  }

  _fetchSessions() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getStudents();

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
          height: 10,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  globals.DefaultListSideBorderPadding,
                  globals.DefaultListTopMostPadding - 10,
                  globals.DefaultListSideBorderPadding,
                  globals.DefaultListTopMostPadding - 10),
              margin: EdgeInsets.fromLTRB(
                  globals.DefaultListSideBorderPadding + 10,
                  globals.DefaultListTopMostPadding - 20,
                  globals.DefaultListSideBorderPadding + 10,
                  globals.DefaultListTopMostPadding - 20),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 5,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].studentName,
                            style: TextStyle(
                                fontSize: globals.DefaultSessionsListFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          //alignment: Alignment.centerLeft,
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].studentId,
                            style: TextStyle(
                                fontSize: globals.DefaultSessionsListFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: globals.DefaultListBetweenRowsPadding,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[],
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
                            _apiResponse.data[index].studentEmail,
                            style: TextStyle(
                                fontSize: globals.DefaultListSecondRowFontSize,
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

            onTap: () => null, //Navigator.of(context).push(
            //MaterialPageRoute(builder: (_) => StudentSessionScreen()),
            //),
          );
        },
        itemCount: _apiResponse.data.length,
      );
    });
  }
}
