// tiuku
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiuku_app/services/api_faculty_services.dart';
import 'package:tiuku_app/services/api_student_services.dart';
import 'package:tiuku_app/views/admin_main_screen.dart';
import 'package:tiuku_app/views/faculty_segments_screen.dart';
import 'package:tiuku_app/views/student_segments_screen.dart';

import './globals.dart' as globals;

//GetIt getIt = GetIt.instance;
void setupLocator() {
  GetIt.instance.registerLazySingleton(() => ApiStudentService());
  GetIt.instance.registerLazySingleton(() => ApiFacultyService());
  // To get it... get it? GetIt.I<SegmentsService>();
}

void main() {
  setupLocator();
  runApp(MaterialApp(
    title: 'tiuku AppProto',
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku MainScreen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: globals.MainScreenContainerSpacing * 4,
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: globals.DefaultButtonWidth,
                child: RaisedButton(
                  child: Text(globals.MainScreenAdminText),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminMainScreen()),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: globals.DefaultButtonWidth,
                child: RaisedButton(
                  child: Text(globals.MainScreenFacultyText),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacultyMainScreen()),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            Flexible(
              child: Container(
                width: globals.DefaultButtonWidth,
                child: RaisedButton(
                  child: Text(globals.MainScreenStudentText),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentSegmentsScreen()),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
            ),
            /*
            Flexible(
              child: Container(
                width: globals.DefaultButtonWidth,
                child: RaisedButton(
                  child: Text('TestIt'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => null),
                    );
                  },
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
