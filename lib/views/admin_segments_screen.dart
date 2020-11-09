import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/admin_segments_list_view.dart';

import 'admin_create_segment_screen.dart';

class AdminSegmentsScreen extends StatefulWidget {
  final String segmentID;
  AdminSegmentsScreen(this.segmentID);

  @override
  _AdminSegmentsScreenState createState() => _AdminSegmentsScreenState();
}

class _AdminSegmentsScreenState extends State<AdminSegmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AdminCreateSegment(widget.segmentID)));
        },
      ),
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('Admin Segment View'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text('Segments for the course'),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              alignment: Alignment.center,
              //padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              //child: AdminSegmentDataView(),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(60, 0, 60, 5),
              child: AdminSegmentList(widget.segmentID),
            )
          ],
        ),
      ),
    );
  }
}
