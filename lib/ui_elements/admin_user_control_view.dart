import 'package:flutter/material.dart';

class AdminUserControlView extends StatefulWidget {
  @override
  _AdminUserControlViewState createState() => _AdminUserControlViewState();
}

class _AdminUserControlViewState extends State<AdminUserControlView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Text('Total'),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Text('Category_'),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Text('Target'),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Text('Category'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white54,
      ),
    );
  }
}
