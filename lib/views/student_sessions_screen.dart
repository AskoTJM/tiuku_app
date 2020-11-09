import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/student_session_data_view.dart';
import 'package:tiuku_app/ui_elements/student_sessions_list_view.dart';

class StudentSessionsScreen extends StatefulWidget {
  final String segmentID;
  StudentSessionsScreen(this.segmentID);

  @override
  _StudentSessionsScreenState createState() => _StudentSessionsScreenState();
}

class _StudentSessionsScreenState extends State<StudentSessionsScreen> {
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
        title: Text('tiuku Student Sessions'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              alignment: Alignment.center,
              //padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: StudentSessionDataView(),
            ),
          ),
          Flexible(
            flex: 15,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: StudentSessionList(widget.segmentID),
            ),
          ),
        ],
      ),
    );
  }
}
