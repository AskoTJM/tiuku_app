import 'package:flutter/material.dart';
import 'package:tiuku_app/classes/segment.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/faculty_segment_data_view.dart';
import 'package:tiuku_app/ui_elements/faculty_sessions_list.dart';

class FacultySegmentDataScreen extends StatefulWidget {
  final StudentSegmentViewData segmentID;
  FacultySegmentDataScreen(this.segmentID);

  @override
  _FacultySegmentDataScreenState createState() =>
      _FacultySegmentDataScreenState();
}

class _FacultySegmentDataScreenState extends State<FacultySegmentDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          // TODO add your logic here to add stuff
        },
      ),
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('Faculty Segment Data'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                //alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text('Stats for Segment'),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                alignment: Alignment.center,
                //padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: FacultySegmentDataView(),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
                child: FacultySessionList(widget.segmentID),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
