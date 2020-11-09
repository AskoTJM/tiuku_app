import 'package:flutter/material.dart';

class FacultySegmentDataView extends StatefulWidget {
  @override
  _FacultySegmentDataViewState createState() => _FacultySegmentDataViewState();
}

class _FacultySegmentDataViewState extends State<FacultySegmentDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text('Total'),
              ),
              Container(
                child: Text('Category_'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text('Target'),
              ),
              Container(
                child: Text('Category_'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
