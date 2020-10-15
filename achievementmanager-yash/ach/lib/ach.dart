import 'package:cloud_firestore/cloud_firestore.dart';

class Ach{
  // ignore: non_constant_identifier_names
  String ach_image;
  String category;
  String description;
  String uid;
  String email;
  Timestamp createdAt;
  Timestamp updatedAt;

  Ach.fromMap(Map<String,dynamic> data){

    ach_image = data['ach_image'];
    category  = data['category'];
    description = data['description'];
    uid        = data['uid'];
    email      = data['email'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  
}