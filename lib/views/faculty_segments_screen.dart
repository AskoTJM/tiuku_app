import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/faculty_segment_list_view.dart';

class FacultyMainScreen extends StatefulWidget {
  @override
  _FacultyMainScreenState createState() => _FacultyMainScreenState();
}

class _FacultyMainScreenState extends State<FacultyMainScreen> {
  bool _activeIsChecked = true;
  bool _archivedIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('Faculty Segments'),
      ),
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(globals.FacultyMainScreenChoiceInformation),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      child: CheckboxListTile(
                          title: Text(globals.FacultyMainScreenChoiceActive),
                          value: _activeIsChecked,
                          onChanged: (bool value) {
                            setState(() {
                              timeDilation = value ? 10.0 : 1.0;
                            });
                          })),
                  Flexible(
                    flex: 3,
                    child: CheckboxListTile(
                        title: Text(globals.FacultyMainScreenChoiceArchived),
                        value: _archivedIsChecked,
                        onChanged: (bool value) {
                          setState(() {
                            timeDilation = value ? 10.0 : 1.0;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: FacultySegmentList(),
            )
          ],
        ),
      ),
    );
  }
}
