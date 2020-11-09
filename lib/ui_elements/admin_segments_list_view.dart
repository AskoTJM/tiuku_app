import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';

class AdminSegmentList extends StatefulWidget {
  final String courseId;
  AdminSegmentList(this.courseId);

  @override
  _AdminSegmentListState createState() => _AdminSegmentListState();
}

class _AdminSegmentListState extends State<AdminSegmentList> {
  String errorMessage;

  bool get isEditing => widget.courseId != null;

  ApiFacultyService get service => GetIt.I<ApiFacultyService>();

  APIResponse<List<StudentSegmentViewData>> _apiResponse;
  bool _isLoading = false;
  var segments = <StudentSegmentViewData>[];

  @override
  void initState() {
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

    _apiResponse = await service.getSegments(widget.courseId);

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    //mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.values,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].segmentName,
                            style: TextStyle(
                                fontSize: globals.DefaultSessionsListFontSize,
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
                            '', //_apiResponse.data[index].scope.toString(),
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
                        flex: 3,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].facultyName,
                            //'${globals.StudentSessionsCategory} :  ${_apiResponse.data[index].category.toString()}',
                            style: TextStyle(
                                fontSize: globals.DefaultSessionsListFontSize,
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
                            _apiResponse.data[index].scope.toString(),
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
