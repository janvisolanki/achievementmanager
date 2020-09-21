import 'package:ach/auth.dart';
import 'package:ach/user.dart';
import 'package:ach/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

