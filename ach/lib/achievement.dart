
import 'dart:io';

import 'package:ach/ach_notifier.dart';
import 'package:ach/achievement_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ach/ach_notifier.dart';
import 'package:ach/auth.dart';
import 'package:ach/ach.dart';


// ignore: must_be_immutable
class Achievement extends StatefulWidget {
  String uid;
  Achievement({this.uid});

  @override
  _AchievementState createState() => _AchievementState();
  
}

class _AchievementState extends State<Achievement> {

  @override
  void initState() {
    // TODO: implement initState
    
    AchNotifier achNotifier = Provider.of<AchNotifier>(context,listen: false);
    getach(achNotifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AchNotifier achNotifier = Provider.of<AchNotifier>(context,listen: false);
    
    Future<void> _refreshList() async {
      getach(achNotifier);
    }


    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        backgroundColor: Color(0xff000000),
      ),
      body: StreamBuilder(stream: Firestore.instance.collection("achievement").snapshots(),
                          builder: (context,snapshot){
                            return ListView.builder(
                              itemCount : snapshot.data.documents.length,
                              itemBuilder: (context,index){
                                DocumentSnapshot _achievement =snapshot.data.documents[index];
                                return ListTile(
                                  leading: Image.network(_achievement['ach_image']),
                                  title: Text(_achievement['category']),
                                  subtitle: Text(_achievement['description']),

                                );
                              },
                            );

                          },
                          
                        
                          ),

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