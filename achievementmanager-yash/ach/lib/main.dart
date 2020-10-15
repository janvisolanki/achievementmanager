import 'package:ach/HomePage.dart';
import 'package:ach/Login.dart';
import 'package:ach/Start.dart';
import 'package:ach/ach_notifier.dart';
import 'package:ach/auth.dart';
import 'package:ach/user.dart';
import 'package:ach/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ach/notifierlistener.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achievement Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
 
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  
FirebaseUser user;
FirebaseAuth auth = FirebaseAuth.instance;



  @override
   initState()  {
    
    super.initState();
   
      print("null");
          Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder:
                                                              (context) => 
                                                              Start()
                                                             )
                                           )
             );
      
      }
      @override
      Widget build(BuildContext context) {
       
       return Scaffold(
        
       backgroundColor: Colors.white,
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Image.asset(
              'images/logo2.png',
      
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Achievement Manager',
           
              style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,
                  color: Color(0xFF174D73),
                  height: 2.5,
                fontFamily: 'Helvetica'
                
    
              ),
    
            ),
            
            Text(
              '"Save your achievements here...."',
              
              style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,
                  color: Color(0xFF174D73),
    
                fontFamily: 'Helvetica'
    
                
              ), 
            
              ),
          ],
         ),
        ),
      );
    }
    
}