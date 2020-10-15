import 'dart:ffi';
import 'dart:io';

import 'package:ach/ach_notifier.dart';
import 'package:ach/achievement_form.dart';
import 'package:ach/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ach/ach_notifier.dart';
import 'package:ach/auth.dart';
import 'package:ach/ach.dart';
import 'package:ach/achievement_form.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class Achievement extends StatefulWidget {
  String uid;
  Achievement({this.uid});

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  FirebaseAuth auth = FirebaseAuth.instance;

  var firebaseUser;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    user;
  }

  Future<String> get user async {
    firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {});
    return firebaseUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width * 0.6;

    print("building Feed");
    var collection = user;
    print(firebaseUser.email.toString());
    String c = collection.toString();
    print(c);

    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        backgroundColor: Color(0xff2F1E54),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("final_ach")
            .where("uid", isEqualTo: firebaseUser.uid.toString())
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot _achievement = snapshot.data.documents[index];
              return Container(
                height: 120,
               
                            child: Card(
                              
                                child: Row(
                                  
                                  children: <Widget>[
                                    
                                    Container(
                                      padding: const EdgeInsets.only(left:10.0),
                                      width: 100,
                                      height: 80,
                                      child: Image.network(
                                          _achievement['ach_image']),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(_achievement['category']??'default',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff2F1E54),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: width,
                                            child: Text(
                                              _achievement['description']??'default',
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F1E54)),
                                            ),
                                          
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                          
                                color: Color(0xffffffff),
                                shadowColor: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20.0)),
                                   elevation: 7,
  
                                                        
              ),
           
              padding: EdgeInsets.only(top:7),
              
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
        backgroundColor: Color(0xff2F1E54),
      ),
      backgroundColor: Colors.indigo[100],
    );
  }
}
