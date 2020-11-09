import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/student_segment_data_view.dart';
import 'package:tiuku_app/ui_elements/student_segment_list_view.dart';

class StudentSegmentsScreen extends StatefulWidget {
  @override
  _StudentSegmentsScreenState createState() => _StudentSegmentsScreenState();
}

class _StudentSegmentsScreenState extends State<StudentSegmentsScreen> {
  bool _activeIsChecked = true;
  bool _archivedIsChecked = false;

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
        title: Text('tiuku Student main'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                child: StudentSegmentDataView(),
              ),
            ),
            Flexible(
              flex: 15,
              child: Container(
                child: StudentSegmentList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
