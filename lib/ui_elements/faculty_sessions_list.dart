import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/classes/session.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';

class FacultySessionList extends StatefulWidget {
  final StudentSegmentViewData segmentID;
  FacultySessionList(this.segmentID);

  @override
  _FacultySessionListState createState() => _FacultySessionListState();
}

class _FacultySessionListState extends State<FacultySessionList> {
  String errorMessage;
  bool get isEditing => widget.segmentID != null;
  ApiFacultyService get service => GetIt.I<ApiFacultyService>();

  APIResponse<List<SessionReport>> _apiResponse;
  bool _isLoading = false;
  var sessions = <SessionReport>[];

  @override
  void initState() {
    //print(widget.segmentID);
    _fetchSessions();
    super.initState();
  }
  /*
    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      service.getSessions(widget.segmentID).then((_apiResponse) {
        setState(() {
          _isLoading = false;
        });

        if (_apiResponse.error) {
          errorMessage = _apiResponse.errorMessage ?? 'An error occurred';
        }
        sessions = _apiResponse.data;
        //_titleController.text = note.noteTitle;
        //_contentController.text = note.noteContent;
      });
    }
  }
*/

  _fetchSessions() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getSessionsForSegment(widget.segmentID);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
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
              //child: Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    globals.DefaultListSideBorderPadding,
                    globals.DefaultListTopMostPadding - 10,
                    globals.DefaultListSideBorderPadding,
                    globals.DefaultListTopMostPadding - 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              _apiResponse.data[index]
                                  .studentName, //_apiResponse.data[index].privacy.toString(),
                              style: TextStyle(
                                  fontSize:
                                      globals.DefaultListSecondRowFontSize,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              _apiResponse.data[index].categoryName,
                              style: TextStyle(
                                  fontSize: globals.DefaultSessionsListFontSize,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.values,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              globals.StudentSessionsStartTime,
                              style: TextStyle(
                                  fontSize: globals.DefaultSessionsListFontSize,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              _apiResponse.data[index].startTime.toString(),
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
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              globals.StudentSessionsEndTime,
                              style: TextStyle(
                                  fontSize: globals.DefaultSessionsListFontSize,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            //width: globals.SegmentListSpacing,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              _apiResponse.data[index].endTime.toString(),
                              style: TextStyle(
                                  fontSize: globals.DefaultSessionsListFontSize,
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
              //MaterialPageRoute(
              //    builder: (_) =>
              //        StudentSessionEditScreen(_apiResponse.data[index])),
              //),
            );
          },
          itemCount: _apiResponse.data.length,
        );
      },
    );
  }
}
