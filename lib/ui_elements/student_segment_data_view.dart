import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tiuku_app/globals.dart' as globals;

class StudentSegmentDataView extends StatefulWidget {
  @override
  _StudentSegmentDataViewState createState() => _StudentSegmentDataViewState();
}

class _StudentSegmentDataViewState extends State<StudentSegmentDataView> {
  bool _activeIsChecked = true;
  bool _archivedIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
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
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white54,
      ),
    );
  }
}
