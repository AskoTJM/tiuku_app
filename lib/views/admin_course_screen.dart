import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/admin_course_list_view.dart';
import 'package:tiuku_app/views/admin_create_course_screen.dart';

enum CourseChoice { active, archived }

class AdminCourseScreen extends StatefulWidget {
  @override
  _AdminCourseScreenState createState() => _AdminCourseScreenState();
}

class _AdminCourseScreenState extends State<AdminCourseScreen> {
  var _courseChoice = CourseChoice.active;
  //ValueNotifier<int> courseChoiceNotifier = ValueNotifier<int>(0)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AdminCreateCourse()));
        },
      ),
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('admin Course View'),
      ),
      body: Container(
        child: Column(
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
                    child: RadioListTile<CourseChoice>(
                      title: const Text('Active'),
                      value: CourseChoice.active,
                      groupValue: _courseChoice, //_courseChoice,
                      onChanged: (CourseChoice value) {
                        setState(() {
                          //courseChoiceNotifier.value = 0;
                          //print(courseChoiceNotifier.toString());
                          _courseChoice = value;
                          //print(_courseChoice);
                        });
                      },
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: RadioListTile<CourseChoice>(
                      title: const Text('Archived'),
                      value: CourseChoice.archived,
                      groupValue: _courseChoice,
                      onChanged: (CourseChoice value) {
                        setState(() {
                          //courseChoiceNotifier.value = 1;
                          //print(courseChoiceNotifier.toString());

                          _courseChoice = value;
                          //print(_courseChoice);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: globals.MainScreenContainerSpacing,
              //child: Text(courseChoiceNotifier.toString()),
            ),
            /*
        ValueListenableBuilder(
              valueListenable: courseChoiceNotifier,
              builder: (BuildContext context, int value, Widget child) {

                return Flexible(
             */
            Flexible(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(60, 0, 60, 5),
              child: Builder(
                builder: (_) {
                  if (_courseChoice == CourseChoice.active) {
                    print(_courseChoice.toString());
                    return AdminCourseList(
                        courseChoice: _courseChoice.toString(),
                        key: UniqueKey());
                  } else {
                    print(_courseChoice.toString());
                    return AdminCourseList(
                        courseChoice: _courseChoice.toString(),
                        key: UniqueKey());
                  }
                },
              ),
            )),
            // )
          ],
        ),
      ),
    );
  }
}
