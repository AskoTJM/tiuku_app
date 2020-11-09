import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/views/admin_maintenance_screen.dart';
import 'package:tiuku_app/views/admin_user_screen.dart';

import './admin_course_screen.dart';

class AdminMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku Admin main'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: globals.MainScreenContainerSpacing * 4,
            ),
            Container(
              width: globals.DefaultButtonWidth,
              child: RaisedButton(
                child: Text(globals.AdminMainScreenCourses),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminCourseScreen()),
                  );
                },
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Container(
              width: globals.DefaultButtonWidth,
              child: RaisedButton(
                child: Text(globals.AdminMainScreenUsers),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminUserScreen()),
                  );
                },
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Container(
              width: globals.DefaultButtonWidth,
              child: RaisedButton(
                child: Text(globals.AdminMainScreenMaintenance),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminMaintenanceScreen()),
                  );
                },
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
