import 'package:flutter/material.dart';
import 'package:tiuku_app/globals.dart' as globals;

class AdminMaintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.defaultAppBarBackGroundColor,
        centerTitle: true,
        title: Text('tiuku Admin maintenance'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: globals.DefaultButtonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('return to main'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
