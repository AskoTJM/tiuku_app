import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/classes/api_response.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/services/api_faculty_services.dart';
import 'package:tiuku_app/views/faculty_segment_data_screen.dart';

class FacultySegmentList extends StatefulWidget {
  @override
  _FacultySegmentListState createState() => _FacultySegmentListState();
}

class _FacultySegmentListState extends State<FacultySegmentList> {
  ApiFacultyService get service => GetIt.I<ApiFacultyService>();

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
          height: 10,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                            _apiResponse.data[index].segmentName,
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
                            _apiResponse.data[index].courseName,
                            style: TextStyle(
                                fontSize: globals.DefaultListSecondRowFontSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          //width: globals.SegmentListSpacing,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            _apiResponse.data[index].scope.toString(),
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
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white54,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    FacultySegmentDataScreen(_apiResponse.data[index]),
              ),
            ),
          );
        },
        itemCount: _apiResponse.data.length,
      );
    });
  }
}
