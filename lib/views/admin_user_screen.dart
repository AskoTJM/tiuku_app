import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/admin_user_control_view.dart';
import 'package:tiuku_app/ui_elements/admin_user_list_view.dart';

class AdminUserScreen extends StatefulWidget {
  @override
  _AdminUserScreenState createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  bool _students = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku Admin User'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: AdminUserControlView(),
          ),
          Flexible(
            flex: 5,
            child: AdminUserList(true),
          ),
        ],
      ),
    );
  }
}
