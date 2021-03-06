import 'package:flutter/material.dart';

class FacultyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(height: 1, color: Colors.blue),
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(
            'Hello',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          subtitle: Text('FacultyUserListTest.'),
        );
      },
      itemCount: 15,
    );
  }
}
