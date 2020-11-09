import 'package:flutter/material.dart';

class StudentSessionDataView extends StatefulWidget {
  @override
  _StudentSessionDataViewState createState() => _StudentSessionDataViewState();
}

class _StudentSessionDataViewState extends State<StudentSessionDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Text('Stats for Segment'),
          ),
          Flexible(
            child: Row(
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
          ),
          Flexible(
            child: Row(
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
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white54,
      ),
    );
  }
}
