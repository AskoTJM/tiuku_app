import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;
import 'package:tiuku_app/ui_elements/categories_list_view.dart';

class FacultyCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku Categories List'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(globals.FacultyMainScreenChoiceInformation),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text("Create Category"),
            ),
          ),
          Container(
            height: globals.MainScreenContainerSpacing,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
            child: CategoriesList(),
          )
        ],
      ),
    );
  }
}
