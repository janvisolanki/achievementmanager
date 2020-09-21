import 'package:ach/achievement_form.dart';
import 'package:flutter/material.dart';

class Achievement extends StatefulWidget {
  String uid;
  Achievement({this.uid});

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        backgroundColor: Color(0xff000000),
      ),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AchievementForm()));
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
