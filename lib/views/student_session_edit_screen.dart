import 'package:flutter/material.dart';
import 'package:tiuku_app/classes/session.dart';
import 'package:tiuku_app/globals.dart' as globals;

class StudentSessionEditScreen extends StatefulWidget {
  final Session sessionData;
  StudentSessionEditScreen(this.sessionData);

  @override
  _StudentSessionEditScreenState createState() =>
      _StudentSessionEditScreenState();
}

class _StudentSessionEditScreenState extends State<StudentSessionEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku Student Session'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        //width: double.infinity,
        //decoration: BoxDecoration(
        //  border: Border.all(width: 2.0, color: Colors.deepOrange),
        //),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Text(
                          'Startime:',
                        ),
                      ),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.startTime.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Endtime:'),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.endTime.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Category'),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.category.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Privacy'),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.privacy.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Last updated:'),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.updated.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
            Flexible(
              flex: 15,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Comment:'),
                    ),
                    Container(
                      width: globals.DefaultListSideBorderPadding,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(widget.sessionData.comment),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: globals.DefaultListSideBorderPadding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
